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
                'x-sdk-version'=> '24.2.0',
                'X-Appwrite-Response-Format' => '1.9.5'
            }
            @endpoint = 'https://cloud.appwrite.io/v1'
        end

        # Set Project
        #
        # Your project ID
        #
        # @param [String] value The value to set for the Project header
        #
        # @return [self]
        def set_project(value)
            add_header('x-appwrite-project', value)

            self
        end

        # Set Key
        #
        # Your secret API key
        #
        # @param [String] value The value to set for the Key header
        #
        # @return [self]
        def set_key(value)
            add_header('x-appwrite-key', value)

            self
        end

        # Set JWT
        #
        # Your secret JSON Web Token
        #
        # @param [String] value The value to set for the JWT header
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
        #
        # @param [String] value The value to set for the Session header
        #
        # @return [self]
        def set_session(value)
            add_header('x-appwrite-session', value)

            self
        end

        # Set ForwardedUserAgent
        #
        # The user agent string of the client that made the request
        #
        # @param [String] value The value to set for the ForwardedUserAgent header
        #
        # @return [self]
        def set_forwarded_user_agent(value)
            add_header('x-forwarded-user-agent', value)

            self
        end

        # Set DevKey
        #
        # Your secret dev API key
        #
        # @param [String] value The value to set for the DevKey header
        #
        # @return [self]
        def set_dev_key(value)
            add_header('x-appwrite-dev-key', value)

            self
        end

        # Set Cookie
        #
        # The user cookie to authenticate with. Used by SDKs that forward an incoming Cookie header in server-side runtimes.
        #
        # @param [String] value The value to set for the Cookie header
        #
        # @return [self]
        def set_cookie(value)
            add_header('cookie', value)

            self
        end

        # Set ImpersonateUserId
        #
        # Impersonate a user by ID on an already user-authenticated request. Requires the current request to be authenticated as a user with impersonator capability; X-Appwrite-Key alone is not sufficient. Impersonator users are intentionally granted users.read so they can discover a target before impersonation begins. Internal audit logs still attribute actions to the original impersonator and record the impersonated target only in internal audit payload data.
        #
        # @param [String] value The value to set for the ImpersonateUserId header
        #
        # @return [self]
        def set_impersonate_user_id(value)
            add_header('x-appwrite-impersonate-user-id', value)

            self
        end

        # Set ImpersonateUserEmail
        #
        # Impersonate a user by email on an already user-authenticated request. Requires the current request to be authenticated as a user with impersonator capability; X-Appwrite-Key alone is not sufficient. Impersonator users are intentionally granted users.read so they can discover a target before impersonation begins. Internal audit logs still attribute actions to the original impersonator and record the impersonated target only in internal audit payload data.
        #
        # @param [String] value The value to set for the ImpersonateUserEmail header
        #
        # @return [self]
        def set_impersonate_user_email(value)
            add_header('x-appwrite-impersonate-user-email', value)

            self
        end

        # Set ImpersonateUserPhone
        #
        # Impersonate a user by phone on an already user-authenticated request. Requires the current request to be authenticated as a user with impersonator capability; X-Appwrite-Key alone is not sufficient. Impersonator users are intentionally granted users.read so they can discover a target before impersonation begins. Internal audit logs still attribute actions to the original impersonator and record the impersonated target only in internal audit payload data.
        #
        # @param [String] value The value to set for the ImpersonateUserPhone header
        #
        # @return [self]
        def set_impersonate_user_phone(value)
            add_header('x-appwrite-impersonate-user-phone', value)

            self
        end

        # Set endpoint.
        #
        # @param [String] endpoint The endpoint to set
        #
        # @return [self]
        def set_endpoint(endpoint)
            if not endpoint.start_with?('http://') and not endpoint.start_with?('https://')
                raise Appwrite::Exception.new('Invalid endpoint URL: ' + endpoint)
            end

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

        # Get request headers
        #
        # @return [Hash]
        def get_headers
            @headers.dup
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
            input_file = params[param_name.to_sym]

            case input_file.source_type
            when 'path'
                size = ::File.size(input_file.path)
            when 'string'
                size = input_file.data.bytesize
            end

            if size < @chunk_size
                if input_file.source_type == 'path'
                    input_file.data = IO.read(input_file.path)
                end
                params[param_name.to_sym] = input_file
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
            upload_id = nil
            chunks_uploaded = 0
            if id_param_name&.empty? == false
                upload_id = params[id_param_name]
                # Make a request to check if a file already exists
                begin
                    current = call(
                        method: "GET",
                        path: "#{path}/#{params[id_param_name]}",
                        headers: headers,
                        params: {}
                    )
                    chunks_uploaded = current['chunksUploaded'].to_i
                    offset = chunks_uploaded * @chunk_size
                rescue Appwrite::Exception => error
                    raise error unless error.code.to_i == 404
                end
            end

            total_chunks = (size.to_f / @chunk_size).ceil
            chunks = []
            while offset < size
                chunks << {
                    index: chunks_uploaded.to_i,
                    start: offset,
                    ending: [offset + @chunk_size, size].min
                }
                offset += @chunk_size
                chunks_uploaded = chunks_uploaded.to_i + 1
            end

            result = current if defined?(current)
            return result unless chunks.any?

            upload_chunk = lambda do |chunk, current_upload_id|
                case input_file.source_type
                when 'path'
                    string = IO.read(input_file.path, chunk[:ending] - chunk[:start], chunk[:start])
                when 'string'
                    string = input_file.data.byteslice(chunk[:start], chunk[:ending] - chunk[:start])
                end

                chunk_params = params.merge(param_name.to_sym => InputFile::from_string(
                    string,
                    filename: input_file.filename,
                    mime_type: input_file.mime_type
                ))

                chunk_headers = headers.merge('content-range' => "bytes #{chunk[:start]}-#{chunk[:ending] - 1}/#{size}")
                chunk_headers['x-appwrite-id'] = current_upload_id if current_upload_id

                call(
                    method: 'POST',
                    path: path,
                    headers: chunk_headers,
                    params: chunk_params,
                )
            end

            result = upload_chunk.call(chunks.first, upload_id)
            upload_id = result['$id'] if result['$id']
            completed_count = chunks.first[:index] + 1
            uploaded_size = chunks.first[:ending]

            upload_complete = lambda do |chunk_result|
                chunks_uploaded = chunk_result['chunksUploaded']
                return false if chunks_uploaded.nil?

                chunks_total = chunk_result['chunksTotal'] || total_chunks
                chunks_uploaded.to_i >= chunks_total.to_i
            end

            on_progress.call({
                id: result['$id'],
                progress: uploaded_size.to_f/size.to_f * 100.0,
                size_uploaded: uploaded_size,
                chunks_total: result['chunksTotal'] || total_chunks,
                chunks_uploaded: result['chunksUploaded'] || completed_count
            }) unless on_progress.nil?

            mutex = Mutex.new
            queue = Queue.new
            chunks.drop(1).each { |chunk| queue << chunk }
            first_error = nil
            last_result = result
            completed_result = nil

            workers = [8, queue.size].min.times.map do
                Thread.new do
                    loop do
                        break if mutex.synchronize { !first_error.nil? }

                        chunk = begin
                            queue.pop(true)
                        rescue ThreadError
                            nil
                        end
                        break unless chunk

                        begin
                            chunk_result = upload_chunk.call(chunk, upload_id)
                        rescue => error
                            mutex.synchronize { first_error ||= error }
                            break
                        end
                        mutex.synchronize do
                            completed_count += 1
                            uploaded_size += chunk[:ending] - chunk[:start]
                            last_result = chunk_result
                            completed_result = chunk_result if upload_complete.call(chunk_result)
                            on_progress.call({
                                id: upload_id,
                                progress: uploaded_size.to_f/size.to_f * 100.0,
                                size_uploaded: uploaded_size,
                                chunks_total: chunk_result['chunksTotal'] || total_chunks,
                                chunks_uploaded: chunk_result['chunksUploaded'] || completed_count
                            }) unless on_progress.nil?
                        end
                    end
                end
            end

            workers.each(&:join)
            raise first_error if first_error

            result = completed_result || last_result

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

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = !@self_signed
            payload = ''

            headers = @headers.merge(headers)

            params.compact!

            @boundary = "----A30#3ad1"
            if method != "GET"
                case headers[:'content-type']
                    when 'application/json'
                        payload = params.to_json
                    when 'multipart/form-data'
                        payload = encode_form_data(params) + "--#{@boundary}--\r\n"
                        headers[:'content-type'] = "multipart/form-data; boundary=#{@boundary}"
                    else
                        payload = encode(params)
                end
            end

            begin
                response = http.send_request(method, uri.request_uri, payload, headers)
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

            if response.content_type == 'application/json'
                begin
                    result = JSON.parse(response.body)
                rescue JSON::ParserError => e
                    raise Appwrite::Exception.new(response.body, response.code, nil, response.body)
                end

                if response.code.to_i >= 400
                    raise Appwrite::Exception.new(result['message'], response.code, result['type'], response.body)
                end

                unless response_type.respond_to?("from")
                    return result
                end

                return response_type.from(map: result)
            end

            if response.code.to_i >= 400
                raise Appwrite::Exception.new(response.body, response.code, response, response.body)
            end

            if response.respond_to?("body_permitted?")
                return response.body if response.body_permitted?
            end

            return response
        end

        def encode_form_data(value, key=nil)
            case value
            when Hash
                value.map { |k,v| encode_form_data(v,k) }.join
            when Array
                value.map { |v| encode_form_data(v, "#{key}[]") }.join
            when nil
                ''
            else
                post_body = []
                if value.instance_of? InputFile
                    post_body << "--#{@boundary}"
                    post_body << "Content-Disposition: form-data; name=\"#{key}\"; filename=\"#{value.filename}\""
                    post_body << "Content-Type: #{value.mime_type}"
                    post_body << ""
                    post_body << value.data
                else
                    post_body << "--#{@boundary}"
                    post_body << "Content-Disposition: form-data; name=\"#{key}\""
                    post_body << ""
                    post_body << value.to_s
                end
                post_body.join("\r\n") + "\r\n"
            end
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
