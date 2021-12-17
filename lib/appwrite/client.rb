#frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'cgi'

module Appwrite
    class Client

        def initialize
            @headers = {
                'user-agent' => RUBY_PLATFORM + ':ruby-' + RUBY_VERSION,
                'x-sdk-version' => 'appwrite:ruby:2.4.1',                
                'X-Appwrite-Response-Format' => '0.11.0'
            }
            @endpoint = 'https://appwrite.io/v1'
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
            
            headers = @headers.merge(headers)

            @boundary = "----A30#3ad1"
            if method != "GET"
                case headers[:'content-type']
                    when 'application/json'
                        payload = params.to_json
                    when 'multipart/form-data'
                        payload = "--#{@boundary}\r\n" + encode_form_data(params)
                        headers[:'content-type'] = "multipart/form-data; boundary=#{@boundary}"
                    else
                        payload = encode(params)
                end
            end

            begin
                response = @http.send_request(method, uri.request_uri, payload, headers)
            rescue => error
                raise Appwrite::Exception.new(error.message)
            end
            
            # Handle Redirects
            if response.class == Net::HTTPRedirection || response.class == Net::HTTPMovedPermanently
                location = response['location']
                uri = URI.parse(uri.scheme + "://" + uri.host + "" + location)
                
                return fetch(method, uri, headers, {}, response_type, limit - 1)
            end

            if response.content_type == 'application/json'
                begin
                    result = JSON.parse(response.body)
                rescue JSON::ParserError => e
                    raise Appwrite::Exception.new(response.body, response.code, response)
                end

                if response.code.to_i >= 400
                    raise Appwrite::Exception.new(result['message'], result['status'], result)
                end

                unless response_type.respond_to?("from")
                    return result
                end

                return response_type.from(map: result)
            end

            if response.code.to_i >= 400
                raise Appwrite::Exception.new(response.body, response.code, response)
            end

            return response.body if response.body_permitted?
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
                if value.instance_of? File
                    post_body << "Content-Disposition: form-data; name=\"#{key}\"; filename=\"#{value.name}\"\r\n"
                    post_body << "Content-Type: #{value.mime_type}\r\n\r\n"
                    post_body << value.content
                    post_body << "\r\n--#{@boundary}--\r\n"
                else          
                    post_body << "Content-Disposition: form-data; name=\"#{key}\"\r\n\r\n"
                    post_body << "#{value.to_s}" 
                    post_body << "\r\n--#{@boundary}\r\n"
                end
                post_body.join
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
