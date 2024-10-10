#frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'cgi'

module Appwrite
    class Client

        def initialize
            @chunk_size = 5*1024*1024
            @headers = {
                'user-agent' => RUBY_PLATFORM + ':ruby-' + RUBY_VERSION,
                'x-sdk-name'=> 'Ruby',
                'x-sdk-platform'=> 'server',
                'x-sdk-language'=> 'ruby',
                'x-sdk-version'=> '13.0.0',
                'x-appwrite-response-format' => '1.6.0'
            }
            @endpoint = 'https://cloud.appwrite.io/v1'
        end

        # Set Project
        #
        # Your project ID
        #        # @param [String] value The value to set for the Project header
        #
        # @return [self]
        def set_project(value)
            add_header('x-appwrite-project', value)

            self
        end

        # Set Key
        #
        # Your secret API key
        #        # @param [String] value The value to set for the Key header
        #
        # @return [self]
        def set_key(value)
            add_header('x-appwrite-key', value)

            self
        end

        # Set JWT
        #
        # Your secret JSON Web Token
        #        # @param [String] value The value to set for the JWT header
        #
        # @return [self]
        def set_jwt(value)
            add_header('x-appwrite-jwt', value)

            self
        end

        # Set Locale
        #
        # @param [String] value The value to set for the Locale header
        #
        # @return [self]
        def set_locale(value)
            add_header('x-appwrite-locale', value)

            self
        end

        # Set Session
        #
        # The user session to authenticate with
        #        # @param [String] value The value to set for the Session header
        #
        # @return [self]
        def set_session(value)
            add_header('x-appwrite-session', value)

            self
        end

        # Set ForwardedUserAgent
        #
        # The user agent string of the client that made the request
        #        # @param [String] value The value to set for the ForwardedUserAgent header
        #
        # @return [self]
        def set_forwarded_user_agent(value)
            add_header('x-forwarded-user-agent', value)

            self
        end

        # Set endpoint.
        #
        # @param [String] endpoint The endpoint to set
        #
        # @return [self]
        def set_endpoint(endpoint)
            @endpoint = endpoint
            
            self
        end

        # Set self signed.
        #
        # @param [String] self_signed Whether to allow self signed certificates.
        #
        # @return [self]
        def set_self_signed(self_signed = true)
            @self_signed = self_signed

            self
        end

        # Add Header
        #
        # @param [String] key The key for the header to add
        # @param [String] value The value for the header to add
        #
        # @return [self]
        def add_header(key, value)
            @headers[key.downcase] = value

            self
        end

        # Send the HTTP request.
        #
        # @param [String] method The HTTP method for the request
        # @param [String] path The path for the request
        # @param [Hash] headers The headers to send with the request
        # @param [Hash] params The parameters to send with the request
        # @param [Class] response_type The type of response to return
        #
        # @return [self]
        def call(
            method:,
            path: '',
            headers: {},
            params: {},
            response_type: nil
        )
            uri = URI.parse(@endpoint + path + ((method == "GET" && params.length) ? '?' + encode(params) : ''))

            fetch(method, uri, headers, params, response_type)
        end

        def chunked_upload(
            path:,
            headers:,
            params:,
            param_name: '',
            id_param_name: nil,
            on_progress: nil,
            response_type: nil
        )
            payload = params[param_name.to_sym]

            if payload.size < @chunk_size
                return call(
                    method: 'POST',
                    path: path,
                    headers: headers,
                    params: params,
                    response_type: response_type,
                )
            end

            offset = 0
            id_param_name = id_param_name.to_sym if id_param_name
            if id_param_name&.empty? == false && params[id_param_name] != "unique()"
                # Make a request to check if a file already exists
                current = call(
                    method: "GET",
                    path: "#{path}/#{params[id_param_name]}",
                    headers: headers,
                    params: {}
                )
                chunks_uploaded = current['chunksUploaded'].to_i
                offset = chunks_uploaded * @chunk_size
            end

            while offset < payload.size
                params[param_name.to_sym] = Payload.from_binary(
                    payload.to_binary(offset, [@chunk_size, payload.size - offset].min),
                    filename: payload.filename
                )

                headers['content-range'] = "bytes #{offset}-#{[offset + @chunk_size - 1, payload.size - 1].min}/#{payload.size}"

                result = call(
                    method: 'POST',
                    path: path,
                    headers: headers,
                    params: params,
                )

                offset += @chunk_size

                if defined? result['$id']
                    headers['x-appwrite-id'] = result['$id']
                end

                on_progress.call({
                    id: result['$id'],
                    progress: ([offset, payload.size].min).to_f/payload.size.to_f * 100.0,
                    size_uploaded: [offset, payload.size].min,
                    chunks_total: result['chunksTotal'],
                    chunks_uploaded: result['chunksUploaded']
                }) unless on_progress.nil?
            end

            return result unless response_type.respond_to?("from")

            response_type.from(map: result)
        end

        private

        def fetch(
            method,
            uri,
            headers,
            params,
            response_type = nil,
            limit = 5
        )
            raise ArgumentError, 'Too Many HTTP Redirects' if limit == 0

            @http = Net::HTTP.new(uri.host, uri.port) unless defined? @http
            @http.use_ssl = !@self_signed
            payload = ''
            
            headers = @headers.merge(headers.transform_keys(&:to_s))

            params.compact!

            if method != "GET"
                case headers['content-type']
                    when 'application/json'
                        payload = params.to_json
                    when 'multipart/form-data'
                        multipart = MultipartBuilder.new()
                        
                        params.each do |name, value|
                            if value.is_a?(Payload)
                                multipart.add(name, value.to_s, filename: value.filename)
                            else
                                multipart.add(name, value)
                            end
                        end

                        headers['content-type'] = multipart.content_type
                        payload = multipart.body
                    else
                        payload = encode(params)
                end
            end

            begin
                response = @http.send_request(method, uri.request_uri, payload, headers)
            rescue => error
                raise Appwrite::Exception.new(error.message)
            end

            warnings = response['x-appwrite-warning']
            if warnings
                warnings.split(';').each do |warning|
                    warn "Warning: #{warning}"
                end
            end

            location = response['location']
            if response_type == "location"
                return location
            end
            
            # Handle Redirects
            if (response.class == Net::HTTPRedirection || response.class == Net::HTTPMovedPermanently)
                uri = URI.parse(uri.scheme + "://" + uri.host + "" + location)
                return fetch(method, uri, headers, {}, response_type, limit - 1)
            end

            if response.content_type.start_with?('application/json')
                begin
                    result = JSON.parse(response.body)
                rescue JSON::ParserError => e
                    raise Appwrite::Exception.new(response.body, response.code, nil, response)
                end

                if response.code.to_i >= 400
                    raise Appwrite::Exception.new(result['message'], result['status'], result['type'], result)
                end

                if response_type.respond_to?("from")
                    return response_type.from(map: result)
                end

                return result
            end

            if response.code.to_i >= 400
                raise Appwrite::Exception.new(response.body, response.code, response)
            end

            if response.content_type.start_with?('multipart/form-data')
                multipart = MultipartParser.new(response.body, response['content-type'])
                result = multipart.to_hash

                if response_type.respond_to?("from")
                    return response_type.from(map: result)
                end
                
                return result
            end

            if response.class.body_permitted?
                return response.body
            end

            return response
        end

        def encode(value, key = nil)
            case value
            when Hash  then value.map { |k,v| encode(v, append_key(key,k)) }.join('&')
            when Array then value.map { |v| encode(v, "#{key}[]") }.join('&')
            when nil   then ''
            else            
            "#{key}=#{CGI.escape(value.to_s)}" 
            end
        end

        def append_key(root_key, key)
            root_key.nil? ? key : "#{root_key}[#{key.to_s}]"
        end
    end 
end
