#frozen_string_literal: true

module Appwrite
    class Database < Service

        # Get a list of all the user collections. You can use the query params to
        # filter your results. On admin mode, this endpoint will return a list of all
        # of the project's collections. [Learn more about different API
        # modes](/docs/admin).
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of collection to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this param to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the collection used as the starting point for the query, excluding the collection itself. Should be used for efficient pagination when working with large sets of data.
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [CollectionList]
        def list_collections(search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            path = '/database/collections'

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

        # Create a new Collection.
        #
        # @param [string] collection_id Unique Id. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [string] name Collection name. Max length: 128 chars.
        # @param [string] permission Permissions type model to use for reading documents in this collection. You can use collection-level permission set once on the collection using the `read` and `write` params, or you can set document-level permission where each document read and write params will decide who has access to read and write to each document individually. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] read An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [Collection]
        def create_collection(collection_id:, name:, permission:, read:, write:)
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

            path = '/database/collections'

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

        # Get a collection by its unique ID. This endpoint response returns a JSON
        # object with the collection metadata.
        #
        # @param [string] collection_id Collection ID.
        #
        # @return [Collection]
        def get_collection(collection_id:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/database/collections/{collectionId}'
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

        # Update a collection by its unique ID.
        #
        # @param [string] collection_id Collection ID.
        # @param [string] name Collection name. Max length: 128 chars.
        # @param [string] permission Permissions type model to use for reading documents in this collection. You can use collection-level permission set once on the collection using the `read` and `write` params, or you can set document-level permission where each document read and write params will decide who has access to read and write to each document individually. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] read An array of strings with read permissions. By default inherits the existing read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default inherits the existing write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [boolean] enabled Is collection enabled?
        #
        # @return [Collection]
        def update_collection(collection_id:, name:, permission:, read: nil, write: nil, enabled: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if permission.nil?
                raise Appwrite::Exception.new('Missing required parameter: "permission"')
            end

            path = '/database/collections/{collectionId}'
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

        # Delete a collection by its unique ID. Only users with write permissions
        # have access to delete this resource.
        #
        # @param [string] collection_id Collection ID.
        #
        # @return []
        def delete_collection(collection_id:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/database/collections/{collectionId}'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        #
        # @return [AttributeList]
        def list_attributes(collection_id:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/database/collections/{collectionId}/attributes'
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

        # Create a boolean attribute.
        # 
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [boolean] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeBoolean]
        def create_boolean_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/database/collections/{collectionId}/attributes/boolean'
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

        # Create an email attribute.
        # 
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeEmail]
        def create_email_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/database/collections/{collectionId}/attributes/email'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [array] elements Array of elements in enumerated type. Uses length of longest element to determine size.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeEnum]
        def create_enum_attribute(collection_id:, key:, elements:, required:, default: nil, array: nil)
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

            path = '/database/collections/{collectionId}/attributes/enum'
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

        # Create a float attribute. Optionally, minimum and maximum values can be
        # provided.
        # 
        #
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
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/database/collections/{collectionId}/attributes/float'
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

        # Create an integer attribute. Optionally, minimum and maximum values can be
        # provided.
        # 
        #
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
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/database/collections/{collectionId}/attributes/integer'
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

        # Create IP address attribute.
        # 
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeIp]
        def create_ip_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/database/collections/{collectionId}/attributes/ip'
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

        # Create a string attribute.
        # 
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [number] size Attribute size for text attributes, in number of characters.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeString]
        def create_string_attribute(collection_id:, key:, size:, required:, default: nil, array: nil)
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

            path = '/database/collections/{collectionId}/attributes/string'
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

        # Create a URL attribute.
        # 
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        # @param [boolean] required Is attribute required?
        # @param [string] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [boolean] array Is attribute an array?
        #
        # @return [AttributeUrl]
        def create_url_attribute(collection_id:, key:, required:, default: nil, array: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if required.nil?
                raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            path = '/database/collections/{collectionId}/attributes/url'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        #
        # @return []
        def get_attribute(collection_id:, key:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/database/collections/{collectionId}/attributes/{key}'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Attribute Key.
        #
        # @return []
        def delete_attribute(collection_id:, key:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/database/collections/{collectionId}/attributes/{key}'
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

        # Get a list of all the user documents. You can use the query params to
        # filter your results. On admin mode, this endpoint will return a list of all
        # of the project's documents. [Learn more about different API
        # modes](/docs/admin).
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [array] queries Array of query strings.
        # @param [number] limit Maximum number of documents to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the document used as the starting point for the query, excluding the document itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        # @param [array] order_attributes Array of attributes used to sort results.
        # @param [array] order_types Array of order directions for sorting attribtues. Possible values are DESC for descending order, or ASC for ascending order.
        #
        # @return [DocumentList]
        def list_documents(collection_id:, queries: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_attributes: nil, order_types: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/database/collections/{collectionId}/documents'
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

        # Create a new Document. Before using this route, you should create a new
        # collection resource using either a [server
        # integration](/docs/server/database#databaseCreateCollection) API or
        # directly from your database console.
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection). Make sure to define attributes before creating documents.
        # @param [string] document_id Document ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [object] data Document data as JSON object.
        # @param [array] read An array of strings with read permissions. By default only the current user is granted with read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default only the current user is granted with write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [Document]
        def create_document(collection_id:, document_id:, data:, read: nil, write: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            if data.nil?
                raise Appwrite::Exception.new('Missing required parameter: "data"')
            end

            path = '/database/collections/{collectionId}/documents'
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

        # Get a document by its unique ID. This endpoint response returns a JSON
        # object with the document data.
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] document_id Document ID.
        #
        # @return [Document]
        def get_document(collection_id:, document_id:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            path = '/database/collections/{collectionId}/documents/{documentId}'
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

        # Update a document by its unique ID. Using the patch method you can pass
        # only specific fields that will get updated.
        #
        # @param [string] collection_id Collection ID.
        # @param [string] document_id Document ID.
        # @param [object] data Document data as JSON object.
        # @param [array] read An array of strings with read permissions. By default inherits the existing read permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default inherits the existing write permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions.
        #
        # @return [Document]
        def update_document(collection_id:, document_id:, data:, read: nil, write: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            if data.nil?
                raise Appwrite::Exception.new('Missing required parameter: "data"')
            end

            path = '/database/collections/{collectionId}/documents/{documentId}'
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

        # Delete a document by its unique ID. This endpoint deletes only the parent
        # documents, its attributes and relations to other documents. Child documents
        # **will not** be deleted.
        #
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] document_id Document ID.
        #
        # @return []
        def delete_document(collection_id:, document_id:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            path = '/database/collections/{collectionId}/documents/{documentId}'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        #
        # @return [IndexList]
        def list_indexes(collection_id:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/database/collections/{collectionId}/indexes'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Index Key.
        # @param [string] type Index type.
        # @param [array] attributes Array of attributes to index.
        # @param [array] orders Array of index orders.
        #
        # @return [Index]
        def create_index(collection_id:, key:, type:, attributes:, orders: nil)
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

            path = '/database/collections/{collectionId}/indexes'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Index Key.
        #
        # @return [Index]
        def get_index(collection_id:, key:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/database/collections/{collectionId}/indexes/{key}'
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
        # @param [string] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/database#createCollection).
        # @param [string] key Index Key.
        #
        # @return []
        def delete_index(collection_id:, key:)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            path = '/database/collections/{collectionId}/indexes/{key}'
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