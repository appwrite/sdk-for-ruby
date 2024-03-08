#frozen_string_literal: true

module Appwrite
    class Avatars < Service

        def initialize(client)
            @client = client
        end

        # You can use this endpoint to show different browser icons to your users.
        # The code argument receives the browser code as it appears in your user [GET
        # /account/sessions](https://appwrite.io/docs/references/cloud/client-web/account#getSessions)
        # endpoint. Use width, height and quality arguments to change the output
        # settings.
        # 
        # When one dimension is specified and the other is 0, the image is scaled
        # with preserved aspect ratio. If both dimensions are 0, the API provides an
        # image at source quality. If dimensions are not specified, the default size
        # of image returned is 100x100px.
        #
        # @param [Browser] code Browser Code.
        # @param [Integer] width Image width. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] height Image height. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] quality Image quality. Pass an integer between 0 to 100. Defaults to 100.
        #
        # @return []
        def get_browser(code:, width: nil, height: nil, quality: nil)
            api_path = '/avatars/browsers/{code}'
                .gsub('{code}', code)

            if code.nil?
              raise Appwrite::Exception.new('Missing required parameter: "code"')
            end

            api_params = {
                width: width,
                height: height,
                quality: quality,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # The credit card endpoint will return you the icon of the credit card
        # provider you need. Use width, height and quality arguments to change the
        # output settings.
        # 
        # When one dimension is specified and the other is 0, the image is scaled
        # with preserved aspect ratio. If both dimensions are 0, the API provides an
        # image at source quality. If dimensions are not specified, the default size
        # of image returned is 100x100px.
        # 
        #
        # @param [CreditCard] code Credit Card Code. Possible values: amex, argencard, cabal, censosud, diners, discover, elo, hipercard, jcb, mastercard, naranja, targeta-shopping, union-china-pay, visa, mir, maestro.
        # @param [Integer] width Image width. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] height Image height. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] quality Image quality. Pass an integer between 0 to 100. Defaults to 100.
        #
        # @return []
        def get_credit_card(code:, width: nil, height: nil, quality: nil)
            api_path = '/avatars/credit-cards/{code}'
                .gsub('{code}', code)

            if code.nil?
              raise Appwrite::Exception.new('Missing required parameter: "code"')
            end

            api_params = {
                width: width,
                height: height,
                quality: quality,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # Use this endpoint to fetch the favorite icon (AKA favicon) of any remote
        # website URL.
        # 
        #
        # @param [String] url Website URL which you want to fetch the favicon from.
        #
        # @return []
        def get_favicon(url:)
            api_path = '/avatars/favicon'

            if url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_params = {
                url: url,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # You can use this endpoint to show different country flags icons to your
        # users. The code argument receives the 2 letter country code. Use width,
        # height and quality arguments to change the output settings. Country codes
        # follow the [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1) standard.
        # 
        # When one dimension is specified and the other is 0, the image is scaled
        # with preserved aspect ratio. If both dimensions are 0, the API provides an
        # image at source quality. If dimensions are not specified, the default size
        # of image returned is 100x100px.
        # 
        #
        # @param [Flag] code Country Code. ISO Alpha-2 country code format.
        # @param [Integer] width Image width. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] height Image height. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] quality Image quality. Pass an integer between 0 to 100. Defaults to 100.
        #
        # @return []
        def get_flag(code:, width: nil, height: nil, quality: nil)
            api_path = '/avatars/flags/{code}'
                .gsub('{code}', code)

            if code.nil?
              raise Appwrite::Exception.new('Missing required parameter: "code"')
            end

            api_params = {
                width: width,
                height: height,
                quality: quality,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # Use this endpoint to fetch a remote image URL and crop it to any image size
        # you want. This endpoint is very useful if you need to crop and display
        # remote images in your app or in case you want to make sure a 3rd party
        # image is properly served using a TLS protocol.
        # 
        # When one dimension is specified and the other is 0, the image is scaled
        # with preserved aspect ratio. If both dimensions are 0, the API provides an
        # image at source quality. If dimensions are not specified, the default size
        # of image returned is 400x400px.
        # 
        #
        # @param [String] url Image URL which you want to crop.
        # @param [Integer] width Resize preview image width, Pass an integer between 0 to 2000. Defaults to 400.
        # @param [Integer] height Resize preview image height, Pass an integer between 0 to 2000. Defaults to 400.
        #
        # @return []
        def get_image(url:, width: nil, height: nil)
            api_path = '/avatars/image'

            if url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_params = {
                url: url,
                width: width,
                height: height,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # Use this endpoint to show your user initials avatar icon on your website or
        # app. By default, this route will try to print your logged-in user name or
        # email initials. You can also overwrite the user name if you pass the 'name'
        # parameter. If no name is given and no user is logged, an empty avatar will
        # be returned.
        # 
        # You can use the color and background params to change the avatar colors. By
        # default, a random theme will be selected. The random theme will persist for
        # the user's initials when reloading the same theme will always return for
        # the same initials.
        # 
        # When one dimension is specified and the other is 0, the image is scaled
        # with preserved aspect ratio. If both dimensions are 0, the API provides an
        # image at source quality. If dimensions are not specified, the default size
        # of image returned is 100x100px.
        # 
        #
        # @param [String] name Full Name. When empty, current user name or email will be used. Max length: 128 chars.
        # @param [Integer] width Image width. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] height Image height. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [String] background Changes background color. By default a random color will be picked and stay will persistent to the given name.
        #
        # @return []
        def get_initials(name: nil, width: nil, height: nil, background: nil)
            api_path = '/avatars/initials'

            api_params = {
                name: name,
                width: width,
                height: height,
                background: background,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # Converts a given plain text to a QR code image. You can use the query
        # parameters to change the size and style of the resulting image.
        # 
        #
        # @param [String] text Plain text to be converted to QR code image.
        # @param [Integer] size QR code size. Pass an integer between 1 to 1000. Defaults to 400.
        # @param [Integer] margin Margin from edge. Pass an integer between 0 to 10. Defaults to 1.
        # @param [] download Return resulting image with 'Content-Disposition: attachment ' headers for the browser to start downloading it. Pass 0 for no header, or 1 for otherwise. Default value is set to 0.
        #
        # @return []
        def get_qr(text:, size: nil, margin: nil, download: nil)
            api_path = '/avatars/qr'

            if text.nil?
              raise Appwrite::Exception.new('Missing required parameter: "text"')
            end

            api_params = {
                text: text,
                size: size,
                margin: margin,
                download: download,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
    end 
end