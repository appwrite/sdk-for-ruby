#frozen_string_literal: true

module Appwrite
    class Storage < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the storage buckets. You can use the query params to
        # filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: enabled, name, fileSecurity, maximumFileSize, encryption, antivirus
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [BucketList]
        def list_buckets(queries: nil, search: nil)

            path = '/storage/buckets'

            params = {
                queries: queries,
                search: search,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::BucketList
            )
        end

        
        # Create a new storage bucket.
        #
        # @param [String] bucket_id Unique Id. Choose your own unique ID or pass the string `unique()` to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Bucket name
        # @param [] file_security Enables configuring permissions for individual file. A user needs one of file or bucket level permissions to access a file. [Learn more about permissions](/docs/permissions).
        # @param [Array] permissions An array of permission strings. By default no user is granted with any permissions. [Learn more about permissions](/docs/permissions).
        # @param [] enabled Is bucket enabled?
        # @param [Integer] maximum_file_size Maximum file size allowed in bytes. Maximum allowed value is 30MB. For self-hosted setups you can change the max limit by changing the `_APP_STORAGE_LIMIT` environment variable. [Learn more about storage environment variables](docs/environment-variables#storage)
        # @param [Array] allowed_file_extensions Allowed file extensions. Maximum of 100 extensions are allowed, each 64 characters long.
        # @param [String] compression Compression algorithm choosen for compression. Can be one of none,  [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd), For file size above 20MB compression is skipped even if it&#039;s enabled
        # @param [] encryption Is encryption enabled? For file size above 20MB encryption is skipped even if it&#039;s enabled
        # @param [] antivirus Is virus scanning enabled? For file size above 20MB AntiVirus scanning is skipped even if it&#039;s enabled
        #
        # @return [Bucket]
        def create_bucket(bucket_id:, name:, file_security:, permissions: nil, enabled: nil, maximum_file_size: nil, allowed_file_extensions: nil, compression: nil, encryption: nil, antivirus: nil)

            path = '/storage/buckets'

            params = {
                bucketId: bucket_id,
                name: name,
                permissions: permissions,
                fileSecurity: file_security,
                enabled: enabled,
                maximumFileSize: maximum_file_size,
                allowedFileExtensions: allowed_file_extensions,
                compression: compression,
                encryption: encryption,
                antivirus: antivirus,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if file_security.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileSecurity"')
            end


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Bucket
            )
        end

        
        # Get a storage bucket by its unique ID. This endpoint response returns a
        # JSON object with the storage bucket metadata.
        #
        # @param [String] bucket_id Bucket unique ID.
        #
        # @return [Bucket]
        def get_bucket(bucket_id:)

            path = '/storage/buckets/{bucketId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

                .gsub('{bucketId}', bucket_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Bucket
            )
        end

        
        # Update a storage bucket by its unique ID.
        #
        # @param [String] bucket_id Bucket unique ID.
        # @param [String] name Bucket name
        # @param [] file_security Enables configuring permissions for individual file. A user needs one of file or bucket level permissions to access a file. [Learn more about permissions](/docs/permissions).
        # @param [Array] permissions An array of permission strings. By default the current permissions are inherited. [Learn more about permissions](/docs/permissions).
        # @param [] enabled Is bucket enabled?
        # @param [Integer] maximum_file_size Maximum file size allowed in bytes. Maximum allowed value is 30MB. For self hosted version you can change the limit by changing _APP_STORAGE_LIMIT environment variable. [Learn more about storage environment variables](docs/environment-variables#storage)
        # @param [Array] allowed_file_extensions Allowed file extensions. Maximum of 100 extensions are allowed, each 64 characters long.
        # @param [String] compression Compression algorithm choosen for compression. Can be one of none, [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd), For file size above 20MB compression is skipped even if it&#039;s enabled
        # @param [] encryption Is encryption enabled? For file size above 20MB encryption is skipped even if it&#039;s enabled
        # @param [] antivirus Is virus scanning enabled? For file size above 20MB AntiVirus scanning is skipped even if it&#039;s enabled
        #
        # @return [Bucket]
        def update_bucket(bucket_id:, name:, file_security:, permissions: nil, enabled: nil, maximum_file_size: nil, allowed_file_extensions: nil, compression: nil, encryption: nil, antivirus: nil)

            path = '/storage/buckets/{bucketId}'

            params = {
                name: name,
                permissions: permissions,
                fileSecurity: file_security,
                enabled: enabled,
                maximumFileSize: maximum_file_size,
                allowedFileExtensions: allowed_file_extensions,
                compression: compression,
                encryption: encryption,
                antivirus: antivirus,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if file_security.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileSecurity"')
            end

                .gsub('{bucketId}', bucket_id)

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Bucket
            )
        end

        
        # Delete a storage bucket by its unique ID.
        #
        # @param [String] bucket_id Bucket unique ID.
        #
        # @return []
        def delete_bucket(bucket_id:)

            path = '/storage/buckets/{bucketId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

                .gsub('{bucketId}', bucket_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Get a list of all the user files. You can use the query params to filter
        # your results. On admin mode, this endpoint will return a list of all of the
        # project's files. [Learn more about different API modes](/docs/admin).
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, signature, mimeType, sizeOriginal, chunksTotal, chunksUploaded
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [FileList]
        def list_files(bucket_id:, queries: nil, search: nil)

            path = '/storage/buckets/{bucketId}/files'

            params = {
                queries: queries,
                search: search,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

                .gsub('{bucketId}', bucket_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::FileList
            )
        end

        
        # Create a new file. Before using this route, you should create a new bucket
        # resource using either a [server
        # integration](/docs/server/storage#storageCreateBucket) API or directly from
        # your Appwrite console.
        # 
        # Larger files should be uploaded using multiple requests with the
        # [content-range](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Range)
        # header to send a partial request with a maximum supported chunk of `5MB`.
        # The `content-range` header values should always be in bytes.
        # 
        # When the first request is sent, the server will return the **File** object,
        # and the subsequent part request must include the file's **id** in
        # `x-appwrite-id` header to allow the server to know that the partial upload
        # is for the existing file and not for a new one.
        # 
        # If you're creating a new file using one of the Appwrite SDKs, all the
        # chunking logic will be managed by the SDK internally.
        # 
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [String] file_id File ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [file] file Binary file.
        # @param [Array] permissions An array of permission strings. By default the current user is granted with all permissions. [Learn more about permissions](/docs/permissions).
        #
        # @return [File]
        def create_file(bucket_id:, file_id:, file:, permissions: nil, on_progress: nil)

            path = '/storage/buckets/{bucketId}/files'

            params = {
                fileId: file_id,
                file: file,
                permissions: permissions,
            }
            
            headers = {
                "content-type": 'multipart/form-data',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            if file.nil?
                raise Appwrite::Exception.new('Missing required parameter: "file"')
            end

                .gsub('{bucketId}', bucket_id)

            id_param_name = "fileId"
            param_name = 'file'

            @client.chunked_upload(
                path: path,
                headers: headers,
                params: params,
                param_name: param_name,
                id_param_name: id_param_name,
                on_progress: on_progress,
                response_type: Models::File
            )
        end

        
        # Get a file by its unique ID. This endpoint response returns a JSON object
        # with the file metadata.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [String] file_id File ID.
        #
        # @return [File]
        def get_file(bucket_id:, file_id:)

            path = '/storage/buckets/{bucketId}/files/{fileId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::File
            )
        end

        
        # Update a file by its unique ID. Only users with write permissions have
        # access to update this resource.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [String] file_id File unique ID.
        # @param [Array] permissions An array of permission string. By default the current permissions are inherited. [Learn more about permissions](/docs/permissions).
        #
        # @return [File]
        def update_file(bucket_id:, file_id:, permissions: nil)

            path = '/storage/buckets/{bucketId}/files/{fileId}'

            params = {
                permissions: permissions,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::File
            )
        end

        
        # Delete a file by its unique ID. Only users with write permissions have
        # access to delete this resource.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [String] file_id File ID.
        #
        # @return []
        def delete_file(bucket_id:, file_id:)

            path = '/storage/buckets/{bucketId}/files/{fileId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Get a file content by its unique ID. The endpoint response return with a
        # 'Content-Disposition: attachment' header that tells the browser to start
        # downloading the file to user downloads directory.
        #
        # @param [String] bucket_id Storage bucket ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [String] file_id File ID.
        #
        # @return []
        def get_file_download(bucket_id:, file_id:)

            path = '/storage/buckets/{bucketId}/files/{fileId}/download'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Get a file preview image. Currently, this method supports preview for image
        # files (jpg, png, and gif), other supported formats, like pdf, docs, slides,
        # and spreadsheets, will return the file icon image. You can also pass query
        # string arguments for cutting and resizing your preview image. Preview is
        # supported only for image files smaller than 10MB.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [String] file_id File ID
        # @param [Integer] width Resize preview image width, Pass an integer between 0 to 4000.
        # @param [Integer] height Resize preview image height, Pass an integer between 0 to 4000.
        # @param [String] gravity Image crop gravity. Can be one of center,top-left,top,top-right,left,right,bottom-left,bottom,bottom-right
        # @param [Integer] quality Preview image quality. Pass an integer between 0 to 100. Defaults to 100.
        # @param [Integer] border_width Preview image border in pixels. Pass an integer between 0 to 100. Defaults to 0.
        # @param [String] border_color Preview image border color. Use a valid HEX color, no # is needed for prefix.
        # @param [Integer] border_radius Preview image border radius in pixels. Pass an integer between 0 to 4000.
        # @param [Float] opacity Preview image opacity. Only works with images having an alpha channel (like png). Pass a number between 0 to 1.
        # @param [Integer] rotation Preview image rotation in degrees. Pass an integer between -360 and 360.
        # @param [String] background Preview image background color. Only works with transparent images (png). Use a valid HEX color, no # is needed for prefix.
        # @param [String] output Output format type (jpeg, jpg, png, gif and webp).
        #
        # @return []
        def get_file_preview(bucket_id:, file_id:, width: nil, height: nil, gravity: nil, quality: nil, border_width: nil, border_color: nil, border_radius: nil, opacity: nil, rotation: nil, background: nil, output: nil)

            path = '/storage/buckets/{bucketId}/files/{fileId}/preview'

            params = {
                width: width,
                height: height,
                gravity: gravity,
                quality: quality,
                borderWidth: border_width,
                borderColor: border_color,
                borderRadius: border_radius,
                opacity: opacity,
                rotation: rotation,
                background: background,
                output: output,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Get a file content by its unique ID. This endpoint is similar to the
        # download method but returns with no  'Content-Disposition: attachment'
        # header.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [String] file_id File ID.
        #
        # @return []
        def get_file_view(bucket_id:, file_id:)

            path = '/storage/buckets/{bucketId}/files/{fileId}/view'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
    end 
end