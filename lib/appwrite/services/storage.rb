#frozen_string_literal: true

module Appwrite
    class Storage < Service

        # Get a list of all the storage buckets. You can use the query params to
        # filter your results.
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] cursor ID of the bucket used as the starting point for the query, excluding the bucket itself. Should be used for efficient pagination when working with large sets of data.
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [BucketList]
        def list_buckets(search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            path = '/storage/buckets'

            params = {
                search: search,
                limit: limit,
                offset: offset,
                cursor: cursor,
                cursorDirection: cursor_direction,
                orderType: order_type,
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
        # @param [string] bucket_id Unique Id. Choose your own unique ID or pass the string `unique()` to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [string] name Bucket name
        # @param [string] permission Permissions type model to use for reading files in this bucket. You can use bucket-level permission set once on the bucket using the `read` and `write` params, or you can set file-level permission where each file read and write params will decide who has access to read and write to each file individually. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] read An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [boolean] enabled Is bucket enabled?
        # @param [number] maximum_file_size Maximum file size allowed in bytes. Maximum allowed value is 30MB. For self-hosted setups you can change the max limit by changing the `_APP_STORAGE_LIMIT` environment variable. [Learn more about storage environment variables](docs/environment-variables#storage)
        # @param [array] allowed_file_extensions Allowed file extensions
        # @param [boolean] encryption Is encryption enabled? For file size above 20MB encryption is skipped even if it&#039;s enabled
        # @param [boolean] antivirus Is virus scanning enabled? For file size above 20MB AntiVirus scanning is skipped even if it&#039;s enabled
        #
        # @return [Bucket]
        def create_bucket(bucket_id:, name:, permission:, read: nil, write: nil, enabled: nil, maximum_file_size: nil, allowed_file_extensions: nil, encryption: nil, antivirus: nil)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if permission.nil?
                raise Appwrite::Exception.new('Missing required parameter: "permission"')
            end

            path = '/storage/buckets'

            params = {
                bucketId: bucket_id,
                name: name,
                permission: permission,
                read: read,
                write: write,
                enabled: enabled,
                maximumFileSize: maximum_file_size,
                allowedFileExtensions: allowed_file_extensions,
                encryption: encryption,
                antivirus: antivirus,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Bucket unique ID.
        #
        # @return [Bucket]
        def get_bucket(bucket_id:)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            path = '/storage/buckets/{bucketId}'
                .gsub('{bucketId}', bucket_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Bucket unique ID.
        # @param [string] name Bucket name
        # @param [string] permission Permissions type model to use for reading files in this bucket. You can use bucket-level permission set once on the bucket using the `read` and `write` params, or you can set file-level permission where each file read and write params will decide who has access to read and write to each file individually. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] read An array of strings with read permissions. By default inherits the existing read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default inherits the existing write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [boolean] enabled Is bucket enabled?
        # @param [number] maximum_file_size Maximum file size allowed in bytes. Maximum allowed value is 30MB. For self hosted version you can change the limit by changing _APP_STORAGE_LIMIT environment variable. [Learn more about storage environment variables](docs/environment-variables#storage)
        # @param [array] allowed_file_extensions Allowed file extensions
        # @param [boolean] encryption Is encryption enabled? For file size above 20MB encryption is skipped even if it&#039;s enabled
        # @param [boolean] antivirus Is virus scanning enabled? For file size above 20MB AntiVirus scanning is skipped even if it&#039;s enabled
        #
        # @return [Bucket]
        def update_bucket(bucket_id:, name:, permission:, read: nil, write: nil, enabled: nil, maximum_file_size: nil, allowed_file_extensions: nil, encryption: nil, antivirus: nil)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if permission.nil?
                raise Appwrite::Exception.new('Missing required parameter: "permission"')
            end

            path = '/storage/buckets/{bucketId}'
                .gsub('{bucketId}', bucket_id)

            params = {
                name: name,
                permission: permission,
                read: read,
                write: write,
                enabled: enabled,
                maximumFileSize: maximum_file_size,
                allowedFileExtensions: allowed_file_extensions,
                encryption: encryption,
                antivirus: antivirus,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Bucket unique ID.
        #
        # @return []
        def delete_bucket(bucket_id:)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            path = '/storage/buckets/{bucketId}'
                .gsub('{bucketId}', bucket_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of files to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this param to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the file used as the starting point for the query, excluding the file itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [FileList]
        def list_files(bucket_id:, search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            path = '/storage/buckets/{bucketId}/files'
                .gsub('{bucketId}', bucket_id)

            params = {
                search: search,
                limit: limit,
                offset: offset,
                cursor: cursor,
                cursorDirection: cursor_direction,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # integration](/docs/server/database#storageCreateBucket) API or directly
        # from your Appwrite console.
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
        # @param [string] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] file_id File ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [file] file Binary file.
        # @param [array] read An array of strings with read permissions. By default only the current user is granted with read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default only the current user is granted with write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [File]
        def create_file(bucket_id:, file_id:, file:, read: nil, write: nil, on_progress: nil)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            if file.nil?
                raise Appwrite::Exception.new('Missing required parameter: "file"')
            end

            path = '/storage/buckets/{bucketId}/files'
                .gsub('{bucketId}', bucket_id)

            params = {
                fileId: file_id,
                file: file,
                read: read,
                write: write,
            }

            headers = {
                "content-type": 'multipart/form-data',
            }

            param_name = 'file'

            @client.chunked_upload(
                path: path,
                headers: headers,
                params: params,
                param_name: param_name,
                on_progress: on_progress,
                response_type: Models::File
            )
        end

        # Get a file by its unique ID. This endpoint response returns a JSON object
        # with the file metadata.
        #
        # @param [string] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] file_id File ID.
        #
        # @return [File]
        def get_file(bucket_id:, file_id:)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/buckets/{bucketId}/files/{fileId}'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] file_id File unique ID.
        # @param [array] read An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [File]
        def update_file(bucket_id:, file_id:, read: nil, write: nil)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/buckets/{bucketId}/files/{fileId}'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            params = {
                read: read,
                write: write,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] file_id File ID.
        #
        # @return []
        def delete_file(bucket_id:, file_id:)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/buckets/{bucketId}/files/{fileId}'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Storage bucket ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] file_id File ID.
        #
        # @return []
        def get_file_download(bucket_id:, file_id:)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/buckets/{bucketId}/files/{fileId}/download'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] file_id File ID
        # @param [number] width Resize preview image width, Pass an integer between 0 to 4000.
        # @param [number] height Resize preview image height, Pass an integer between 0 to 4000.
        # @param [string] gravity Image crop gravity. Can be one of center,top-left,top,top-right,left,right,bottom-left,bottom,bottom-right
        # @param [number] quality Preview image quality. Pass an integer between 0 to 100. Defaults to 100.
        # @param [number] border_width Preview image border in pixels. Pass an integer between 0 to 100. Defaults to 0.
        # @param [string] border_color Preview image border color. Use a valid HEX color, no # is needed for prefix.
        # @param [number] border_radius Preview image border radius in pixels. Pass an integer between 0 to 4000.
        # @param [number] opacity Preview image opacity. Only works with images having an alpha channel (like png). Pass a number between 0 to 1.
        # @param [number] rotation Preview image rotation in degrees. Pass an integer between -360 and 360.
        # @param [string] background Preview image background color. Only works with transparent images (png). Use a valid HEX color, no # is needed for prefix.
        # @param [string] output Output format type (jpeg, jpg, png, gif and webp).
        #
        # @return []
        def get_file_preview(bucket_id:, file_id:, width: nil, height: nil, gravity: nil, quality: nil, border_width: nil, border_color: nil, border_radius: nil, opacity: nil, rotation: nil, background: nil, output: nil)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/buckets/{bucketId}/files/{fileId}/preview'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

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
        # @param [string] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](/docs/server/storage#createBucket).
        # @param [string] file_id File ID.
        #
        # @return []
        def get_file_view(bucket_id:, file_id:)
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/buckets/{bucketId}/files/{fileId}/view'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
            )
        end

    end 
end