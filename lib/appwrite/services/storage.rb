#frozen_string_literal: true

module Appwrite
    class Storage < Service

        include Models
        # Get a list of all the user files. You can use the query params to filter
        # your results. On admin mode, this endpoint will return a list of all of the
        # project's files. [Learn more about different API modes](/docs/admin).
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [FileList]
        def list_files(search: nil, limit: nil, offset: nil, order_type: nil)
            path = '/storage/files'

            params = {
                search: search,
                limit: limit,
                offset: offset,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: FileList
            )
        end

        # Create a new file. The user who creates the file will automatically be
        # assigned to read and write access unless he has passed custom values for
        # read and write arguments.
        #
        # @param [File] file Binary file.
        # @param [array] read An array of strings with read permissions. By default only the current user is granted with read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default only the current user is granted with write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        #
        # @return [File]
        def create_file(file:, read: nil, write: nil)
            if file.nil?
                raise Appwrite::Exception.new('Missing required parameter: "file"')
            end

            path = '/storage/files'

            params = {
                file: file,
                read: read,
                write: write,
            }

            headers = {
                "content-type": 'multipart/form-data',
            }

            @client.call(
                method: 'POST',
                path: path,
                params: params,
                headers: headers,
                response_type: File
            )
        end

        # Get a file by its unique ID. This endpoint response returns a JSON object
        # with the file metadata.
        #
        # @param [string] file_id File unique ID.
        #
        # @return [File]
        def get_file(file_id:)
            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/files/{fileId}'
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: File
            )
        end

        # Update a file by its unique ID. Only users with write permissions have
        # access to update this resource.
        #
        # @param [string] file_id File unique ID.
        # @param [array] read An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        #
        # @return [File]
        def update_file(file_id:, read:, write:)
            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            if read.nil?
                raise Appwrite::Exception.new('Missing required parameter: "read"')
            end

            if write.nil?
                raise Appwrite::Exception.new('Missing required parameter: "write"')
            end

            path = '/storage/files/{fileId}'
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
                params: params,
                headers: headers,
                response_type: File
            )
        end

        # Delete a file by its unique ID. Only users with write permissions have
        # access to delete this resource.
        #
        # @param [string] file_id File unique ID.
        #
        # @return []
        def delete_file(file_id:)
            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/files/{fileId}'
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: path,
                params: params,
                headers: headers,
            )
        end

        # Get a file content by its unique ID. The endpoint response return with a
        # 'Content-Disposition: attachment' header that tells the browser to start
        # downloading the file to user downloads directory.
        #
        # @param [string] file_id File unique ID.
        #
        # @return []
        def get_file_download(file_id:)
            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/files/{fileId}/download'
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
            )
        end

        # Get a file preview image. Currently, this method supports preview for image
        # files (jpg, png, and gif), other supported formats, like pdf, docs, slides,
        # and spreadsheets, will return the file icon image. You can also pass query
        # string arguments for cutting and resizing your preview image.
        #
        # @param [string] file_id File unique ID
        # @param [number] width Resize preview image width, Pass an integer between 0 to 4000.
        # @param [number] height Resize preview image height, Pass an integer between 0 to 4000.
        # @param [string] gravity Image crop gravity. Can be one of center,top-left,top,top-right,left,right,bottom-left,bottom,bottom-right
        # @param [number] quality Preview image quality. Pass an integer between 0 to 100. Defaults to 100.
        # @param [number] border_width Preview image border in pixels. Pass an integer between 0 to 100. Defaults to 0.
        # @param [string] border_color Preview image border color. Use a valid HEX color, no # is needed for prefix.
        # @param [number] border_radius Preview image border radius in pixels. Pass an integer between 0 to 4000.
        # @param [number] opacity Preview image opacity. Only works with images having an alpha channel (like png). Pass a number between 0 to 1.
        # @param [number] rotation Preview image rotation in degrees. Pass an integer between 0 and 360.
        # @param [string] background Preview image background color. Only works with transparent images (png). Use a valid HEX color, no # is needed for prefix.
        # @param [string] output Output format type (jpeg, jpg, png, gif and webp).
        #
        # @return []
        def get_file_preview(file_id:, width: nil, height: nil, gravity: nil, quality: nil, border_width: nil, border_color: nil, border_radius: nil, opacity: nil, rotation: nil, background: nil, output: nil)
            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/files/{fileId}/preview'
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
                params: params,
                headers: headers,
            )
        end

        # Get a file content by its unique ID. This endpoint is similar to the
        # download method but returns with no  'Content-Disposition: attachment'
        # header.
        #
        # @param [string] file_id File unique ID.
        #
        # @return []
        def get_file_view(file_id:)
            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            path = '/storage/files/{fileId}/view'
                .gsub('{fileId}', file_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
            )
        end

    end 
end