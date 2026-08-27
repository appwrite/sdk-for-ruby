# frozen_string_literal: true

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
        # @param [Integer] quality Image quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.
        #
        # @return []
        def get_browser(
            code:,
            width: nil,
            height: nil,
            quality: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/png',
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
        # @param [CreditCard] code Credit Card Code. Possible values: amex, argencard, cabal, cencosud, diners, discover, elo, hipercard, jcb, mastercard, naranja, targeta-shopping, unionpay, visa, mir, maestro, rupay.
        # @param [Integer] width Image width. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] height Image height. Pass an integer between 0 to 2000. Defaults to 100.
        # @param [Integer] quality Image quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.
        #
        # @return []
        def get_credit_card(
            code:,
            width: nil,
            height: nil,
            quality: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/png',
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
        # This endpoint does not follow HTTP redirects.
        #
        # @param [String] url Website URL which you want to fetch the favicon from.
        #
        # @return []
        def get_favicon(
            url:
        )
            api_path = '/avatars/favicon'

            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_params = {
                url: url,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/*',
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
        # @param [Integer] quality Image quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.
        #
        # @return []
        def get_flag(
            code:,
            width: nil,
            height: nil,
            quality: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/png',
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
        # This endpoint does not follow HTTP redirects.
        #
        # @param [String] url Image URL which you want to crop.
        # @param [Integer] width Resize preview image width, Pass an integer between 0 to 2000. Defaults to 400.
        # @param [Integer] height Resize preview image height, Pass an integer between 0 to 2000. Defaults to 400.
        #
        # @return []
        def get_image(
            url:,
            width: nil,
            height: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/*',
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
        # email initials. You can also overwrite the user name if you pass the &#039;name&#039;
        # parameter. If no name is given and no user is logged, an empty avatar will
        # be returned.
        #
        # You can use the color and background params to change the avatar colors. By
        # default, a random theme will be selected. The random theme will persist for
        # the user&#039;s initials when reloading the same theme will always return for
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
        def get_initials(
            name: nil,
            width: nil,
            height: nil,
            background: nil
        )
            api_path = '/avatars/initials'

            api_params = {
                name: name,
                width: width,
                height: height,
                background: background,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/png',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Returns the best available profile photo for a user. The endpoint tries
        # each source in priority order and returns the first successful result:
        # OAuth2 identity photo, Gravatar, Libravatar, Appwrite Initials, built-in
        # static fallback.
        #
        # The photo resolves for the currently authenticated user unless `userId`
        # points at another user. Passing `emailHash` and/or `name` resolves the
        # avatar from those values alone: the hash is looked up on Gravatar and
        # Libravatar, the name is rendered as initials, and the user&#039;s own identity
        # photos, email, and name leave the chain so they never shadow the avatar
        # being asked for. Emails are only ever accepted pre-hashed, so no address
        # ends up in a URL.
        #
        # @param [Integer] width Output image width in pixels. Pass an integer between 0 and 2000. Defaults to 256.
        # @param [Integer] height Output image height in pixels. Pass an integer between 0 and 2000. Defaults to 256.
        # @param [Integer] quality Output image quality between 0 and 100. Defaults to 100.
        # @param [String] output Output image format. Defaults to &#039;png&#039;.
        # @param [String] rating Maximum image rating to fetch from Gravatar/Libravatar. Defaults to &#039;g&#039;.
        # @param [String] user_id User ID to resolve the photo for. Defaults to &#039;current()&#039; for the currently authenticated user.
        # @param [String] email_hash SHA256 hash of the lowercase, trimmed email address to look up on Gravatar and Libravatar instead of the user&#039;s own photo sources. Pass the hash, never the address itself.
        # @param [String] name Name to render initials from instead of the user&#039;s own photo sources. Max length: 128 chars.
        #
        # @return []
        def get_photo(
            width: nil,
            height: nil,
            quality: nil,
            output: nil,
            rating: nil,
            user_id: nil,
            email_hash: nil,
            name: nil
        )
            api_path = '/avatars/photo'

            api_params = {
                width: width,
                height: height,
                quality: quality,
                output: output,
                rating: rating,
                userId: user_id,
                emailHash: email_hash,
                name: name,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/*',
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
        # @param [] download Return resulting image with &#039;Content-Disposition: attachment &#039; headers for the browser to start downloading it. Pass 0 for no header, or 1 for otherwise. Default value is set to 0.
        #
        # @return []
        def get_qr(
            text:,
            size: nil,
            margin: nil,
            download: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/png',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Use this endpoint to capture a screenshot of any website URL. This endpoint
        # uses a headless browser to render the webpage and capture it as an image.
        #
        # You can configure the browser viewport size, theme, user agent,
        # geolocation, permissions, and more. Capture either just the viewport or the
        # full page scroll.
        #
        # When width and height are specified, the image is resized accordingly. If
        # both dimensions are 0, the API provides an image at original size. If
        # dimensions are not specified, the default viewport size is 1280x720px.
        #
        # @param [String] url Website URL which you want to capture.
        # @param [Hash] headers HTTP headers to send with the browser request. Defaults to empty.
        # @param [Integer] viewport_width Browser viewport width. Pass an integer between 1 to 1920. Defaults to 1280.
        # @param [Integer] viewport_height Browser viewport height. Pass an integer between 1 to 1080. Defaults to 720.
        # @param [Float] scale Browser scale factor. Pass a number between 0.1 to 3. Defaults to 1.
        # @param [BrowserTheme] theme Browser theme. Pass &quot;light&quot; or &quot;dark&quot;. Defaults to &quot;light&quot;.
        # @param [String] user_agent Custom user agent string. Defaults to browser default.
        # @param [] fullpage Capture full page scroll. Pass 0 for viewport only, or 1 for full page. Defaults to 0.
        # @param [String] locale Browser locale (e.g., &quot;en-US&quot;, &quot;fr-FR&quot;). Defaults to browser default.
        # @param [Timezone] timezone IANA timezone identifier (e.g., &quot;America/New_York&quot;, &quot;Europe/London&quot;). Defaults to browser default.
        # @param [Float] latitude Geolocation latitude. Pass a number between -90 to 90. Defaults to 0.
        # @param [Float] longitude Geolocation longitude. Pass a number between -180 to 180. Defaults to 0.
        # @param [Float] accuracy Geolocation accuracy in meters. Pass a number between 0 to 100000. Defaults to 0.
        # @param [] touch Enable touch support. Pass 0 for no touch, or 1 for touch enabled. Defaults to 0.
        # @param [Array] permissions Browser permissions to grant. Pass an array of permission names like [&quot;geolocation&quot;, &quot;camera&quot;, &quot;microphone&quot;]. Defaults to empty.
        # @param [Integer] sleep Wait time in seconds before taking the screenshot. Pass an integer between 0 to 10. Defaults to 0.
        # @param [Integer] width Output image width. Pass 0 to use original width, or an integer between 1 to 2000. Defaults to 0 (original width).
        # @param [Integer] height Output image height. Pass 0 to use original height, or an integer between 1 to 2000. Defaults to 0 (original height).
        # @param [Integer] quality Screenshot quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.
        # @param [ImageFormat] output Output format type (jpeg, jpg, png, gif and webp).
        #
        # @return []
        def get_screenshot(
            url:,
            headers: nil,
            viewport_width: nil,
            viewport_height: nil,
            scale: nil,
            theme: nil,
            user_agent: nil,
            fullpage: nil,
            locale: nil,
            timezone: nil,
            latitude: nil,
            longitude: nil,
            accuracy: nil,
            touch: nil,
            permissions: nil,
            sleep: nil,
            width: nil,
            height: nil,
            quality: nil,
            output: nil
        )
            api_path = '/avatars/screenshots'

            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_params = {
                url: url,
                headers: headers,
                viewportWidth: viewport_width,
                viewportHeight: viewport_height,
                scale: scale,
                theme: theme,
                userAgent: user_agent,
                fullpage: fullpage,
                locale: locale,
                timezone: timezone,
                latitude: latitude,
                longitude: longitude,
                accuracy: accuracy,
                touch: touch,
                permissions: permissions,
                sleep: sleep,
                width: width,
                height: height,
                quality: quality,
                output: output,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/png',
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
