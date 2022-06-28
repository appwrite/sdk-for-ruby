#frozen_string_literal: true

module Appwrite
    class Databases < Service

        @database_id
        def initialize(client, database_id:)
            @client = client
            @database_id = database_id
        end

        # 
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of collection to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this param to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the collection used as the starting point for the query, excluding the collection itself. Should be used for efficient pagination when working with large sets of data.
        # @param [string] cursor_direction Direction of the cursor, can be either &#039;before&#039; or &#039;after&#039;.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [DatabaseList]
        def list(search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            path = '/databases'

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
                response_type: Models::DatabaseList
            )
        end

        # 
        #
        # @param [string] database_id Unique Id. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [string] name Collection name. Max length: 128 chars.
        #
        # @return [Database]
        def create(name:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/databases'

            params = {
                databaseId: @database_id,
                name: name,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Database
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        #
        # @return [Collection]
        def get()
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            path = '/databases/{databaseId}'
                .gsub('{databaseId}', @database_id)

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
                response_type: Models::Collection
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] name Collection name. Max length: 128 chars.
        #
        # @return [Collection]
        def update(name:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/databases/{databaseId}'
                .gsub('{databaseId}', @database_id)

            params = {
                name: name,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Collection
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        #
        # @return []
        def delete()
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            path = '/databases/{databaseId}'
                .gsub('{databaseId}', @database_id)

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

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of collection to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this param to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the collection used as the starting point for the query, excluding the collection itself. Should be used for efficient pagination when working with large sets of data.
        # @param [string] cursor_direction Direction of the cursor, can be either &#039;before&#039; or &#039;after&#039;.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [CollectionList]
        def list_collections(search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            path = '/databases/{databaseId}/collections'
                .gsub('{databaseId}', @database_id)

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
                response_type: Models::CollectionList
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Unique Id. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [string] name Collection name. Max length: 128 chars.
        # @param [string] permission Specifies the permissions model used in this collection, which accepts either &#039;collection&#039; or &#039;document&#039;. For &#039;collection&#039; level permission, the permissions specified in read and write params are applied to all documents in the collection. For &#039;document&#039; level permissions, read and write permissions are specified in each document. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] read An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [Collection]
        def create_collection(collection_id:, name:, permission:, read:, write:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if permission.nil?
                raise Appwrite::Exception.new('Missing required parameter: "permission"')
            end

            if read.nil?
                raise Appwrite::Exception.new('Missing required parameter: "read"')
            end

            if write.nil?
                raise Appwrite::Exception.new('Missing required parameter: "write"')
            end

            path = '/databases/{databaseId}/collections'
                .gsub('{databaseId}', @database_id)

            params = {
                collectionId: collection_id,
                name: name,
                permission: permission,
                read: read,
                write: write,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Collection
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID.
        #
        # @return [Collection]
        def get_collection(collection_id:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

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
                response_type: Models::Collection
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID.
        # @param [string] name Collection name. Max length: 128 chars.
        # @param [string] permission Permissions type model to use for reading documents in this collection. You can use collection-level permission set once on the collection using the `read` and `write` params, or you can set document-level permission where each document read and write params will decide who has access to read and write to each document individually. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] read An array of strings with read permissions. By default inherits the existing read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default inherits the existing write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [boolean] enabled Is collection enabled?
        #
        # @return [Collection]
        def update_collection(collection_id:, name:, permission:, read: nil, write: nil, enabled: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if permission.nil?
                raise Appwrite::Exception.new('Missing required parameter: "permission"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                name: name,
                permission: permission,
                read: read,
                write: write,
                enabled: enabled,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Collection
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID.
        #
        # @return []
        def delete_collection(collection_id:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

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

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        #
        # @return [AttributeList]
        def list_attributes(collection_id:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

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
                response_type: Models::AttributeList
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [boolean] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeBoolean]
        def create_boolean_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/boolean'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeBoolean
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeEmail]
        def create_email_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/email'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeEmail
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [array] elements Array of elements in enumerated type. Uses length of longest element to determine size. Maximum of 100 elements are allowed, each 4096 characters long.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeEnum]
        def create_enum_attribute(collection_id:, key:, elements:, required:, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if elements.nil?
                raise Appwrite::Exception.new('Missing required parameter: "elements"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/enum'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                elements: elements,
                required: required,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeEnum
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [number] min Minimum value to enforce on new documents
        # @param [number] max Maximum value to enforce on new documents
        # @param [number] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeFloat]
        def create_float_attribute(collection_id:, key:, required:, min: nil, max: nil, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/float'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                required: required,
                min: min,
                max: max,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeFloat
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [number] min Minimum value to enforce on new documents
        # @param [number] max Maximum value to enforce on new documents
        # @param [number] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeInteger]
        def create_integer_attribute(collection_id:, key:, required:, min: nil, max: nil, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/integer'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                required: required,
                min: min,
                max: max,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeInteger
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeIp]
        def create_ip_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/ip'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeIp
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [number] size Attribute size for text attributes, in number of characters.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeString]
        def create_string_attribute(collection_id:, key:, size:, required:, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if size.nil?
                raise Appwrite::Exception.new('Missing required parameter: "size"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/string'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                size: size,
                required: required,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeString
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeUrl]
        def create_url_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/url'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::AttributeUrl
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        #
        # @return []
        def get_attribute(collection_id:, key:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/{key}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{key}', key)

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

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        #
        # @return []
        def delete_attribute(collection_id:, key:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/attributes/{key}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{key}', key)

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

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/database#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [number] limit Maximum number of documents to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the document used as the starting point for the query, excluding the document itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor, can be either &#039;before&#039; or &#039;after&#039;.
        # @param [array] order_attributes Array of attributes used to sort results. Maximum of 100 order attributes are allowed, each 4096 characters long.
        # @param [array] order_types Array of order directions for sorting attribtues. Possible values are DESC for descending order, or ASC for ascending order. Maximum of 100 order types are allowed.
        #
        # @return [DocumentList]
        def list_documents(collection_id:, queries: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_attributes: nil, order_types: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                queries: queries,
                limit: limit,
                offset: offset,
                cursor: cursor,
                cursorDirection: cursor_direction,
                orderAttributes: order_attributes,
                orderTypes: order_types,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::DocumentList
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection). Make sure to define attributes before creating documents.
        # @param [string] document_id Document ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [object] data Document data as JSON object.
        # @param [array] read An array of strings with read permissions. By default only the current user is granted with read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default only the current user is granted with write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [Document]
        def create_document(collection_id:, document_id:, data:, read: nil, write: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            if data.nil?
                raise Appwrite::Exception.new('Missing required parameter: "data"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                documentId: document_id,
                data: data,
                read: read,
                write: write,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Document
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] document_id Document ID.
        #
        # @return [Document]
        def get_document(collection_id:, document_id:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)

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
                response_type: Models::Document
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID.
        # @param [string] document_id Document ID.
        # @param [object] data Document data as JSON object. Include only attribute and value pairs to be updated.
        # @param [array] read An array of strings with read permissions. By default inherits the existing read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default inherits the existing write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [Document]
        def update_document(collection_id:, document_id:, data: nil, read: nil, write: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)

            params = {
                data: data,
                read: read,
                write: write,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Document
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] document_id Document ID.
        #
        # @return []
        def delete_document(collection_id:, document_id:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)

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

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        #
        # @return [IndexList]
        def list_indexes(collection_id:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/indexes'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

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
                response_type: Models::IndexList
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Index Key.
        # @param [string] type Index type.
        # @param [array] attributes Array of attributes to index. Maximum of 100 attributes are allowed, each 32 characters long.
        # @param [array] orders Array of index orders. Maximum of 100 orders are allowed.
        #
        # @return [Index]
        def create_index(collection_id:, key:, type:, attributes:, orders: nil)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "type"')
            end

            if attributes.nil?
                raise Appwrite::Exception.new('Missing required parameter: "attributes"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/indexes'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)

            params = {
                key: key,
                type: type,
                attributes: attributes,
                orders: orders,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Index
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Index Key.
        #
        # @return [Index]
        def get_index(collection_id:, key:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/indexes/{key}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{key}', key)

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
                response_type: Models::Index
            )
        end

        # 
        #
        # @param [string] database_id Database ID.
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Index Key.
        #
        # @return []
        def delete_index(collection_id:, key:)
            if @database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/databases/{databaseId}/collections/{collectionId}/indexes/{key}'
                .gsub('{databaseId}', @database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{key}', key)

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

    end 
end