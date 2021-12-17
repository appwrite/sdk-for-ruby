#frozen_string_literal: true

module Appwrite
    class Database < Service

        include Models
        # Get a list of all the user collections. You can use the query params to
        # filter your results. On admin mode, this endpoint will return a list of all
        # of the project's collections. [Learn more about different API
        # modes](/docs/admin).
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [CollectionList]
        def list_collections(search: nil, limit: nil, offset: nil, order_type: nil)
            path = '/database/collections'

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
                response_type: CollectionList
            )
        end

        # Create a new Collection.
        #
        # @param [string] name Collection name. Max length: 128 chars.
        # @param [array] read An array of strings with read permissions. By default no user is granted with any read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default no user is granted with any write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] rules Array of [rule objects](/docs/rules). Each rule define a collection field name, data type and validation.
        #
        # @return [Collection]
        def create_collection(name:, read:, write:, rules:)
            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if read.nil?
                raise Appwrite::Exception.new('Missing required parameter: "read"')
            end

            if write.nil?
                raise Appwrite::Exception.new('Missing required parameter: "write"')
            end

            if rules.nil?
                raise Appwrite::Exception.new('Missing required parameter: "rules"')
            end

            path = '/database/collections'

            params = {
                name: name,
                read: read,
                write: write,
                rules: rules,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                params: params,
                headers: headers,
                response_type: Collection
            )
        end

        # Get a collection by its unique ID. This endpoint response returns a JSON
        # object with the collection metadata.
        #
        # @param [string] collection_id Collection unique ID.
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
                params: params,
                headers: headers,
                response_type: Collection
            )
        end

        # Update a collection by its unique ID.
        #
        # @param [string] collection_id Collection unique ID.
        # @param [string] name Collection name. Max length: 128 chars.
        # @param [array] read An array of strings with read permissions. By default inherits the existing read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default inherits the existing write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] rules Array of [rule objects](/docs/rules). Each rule define a collection field name, data type and validation.
        #
        # @return [Collection]
        def update_collection(collection_id:, name:, read: nil, write: nil, rules: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/database/collections/{collectionId}'
                .gsub('{collectionId}', collection_id)

            params = {
                name: name,
                read: read,
                write: write,
                rules: rules,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: path,
                params: params,
                headers: headers,
                response_type: Collection
            )
        end

        # Delete a collection by its unique ID. Only users with write permissions
        # have access to delete this resource.
        #
        # @param [string] collection_id Collection unique ID.
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
                params: params,
                headers: headers,
            )
        end

        # Get a list of all the user documents. You can use the query params to
        # filter your results. On admin mode, this endpoint will return a list of all
        # of the project's documents. [Learn more about different API
        # modes](/docs/admin).
        #
        # @param [string] collection_id Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/server/database#createCollection).
        # @param [array] filters Array of filter strings. Each filter is constructed from a key name, comparison operator (=, !=, &gt;, &lt;, &lt;=, &gt;=) and a value. You can also use a dot (.) separator in attribute names to filter by child document attributes. Examples: &#039;name=John Doe&#039; or &#039;category.$id&gt;=5bed2d152c362&#039;.
        # @param [number] limit Maximum number of documents to return in response.  Use this value to manage pagination. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this param to manage pagination.
        # @param [string] order_field Document field that results will be sorted by.
        # @param [string] order_type Order direction. Possible values are DESC for descending order, or ASC for ascending order.
        # @param [string] order_cast Order field type casting. Possible values are int, string, date, time or datetime. The database will attempt to cast the order field to the value you pass here. The default value is a string.
        # @param [string] search Search query. Enter any free text search. The database will try to find a match against all document attributes and children. Max length: 256 chars.
        #
        # @return [DocumentList]
        def list_documents(collection_id:, filters: nil, limit: nil, offset: nil, order_field: nil, order_type: nil, order_cast: nil, search: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            path = '/database/collections/{collectionId}/documents'
                .gsub('{collectionId}', collection_id)

            params = {
                filters: filters,
                limit: limit,
                offset: offset,
                orderField: order_field,
                orderType: order_type,
                orderCast: order_cast,
                search: search,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: DocumentList
            )
        end

        # Create a new Document. Before using this route, you should create a new
        # collection resource using either a [server
        # integration](/docs/server/database#databaseCreateCollection) API or
        # directly from your database console.
        #
        # @param [string] collection_id Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/server/database#createCollection).
        # @param [object] data Document data as JSON object.
        # @param [array] read An array of strings with read permissions. By default only the current user is granted with read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default only the current user is granted with write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [string] parent_document Parent document unique ID. Use when you want your new document to be a child of a parent document.
        # @param [string] parent_property Parent document property name. Use when you want your new document to be a child of a parent document.
        # @param [string] parent_property_type Parent document property connection type. You can set this value to **assign**, **append** or **prepend**, default value is assign. Use when you want your new document to be a child of a parent document.
        #
        # @return [Document]
        def create_document(collection_id:, data:, read: nil, write: nil, parent_document: nil, parent_property: nil, parent_property_type: nil)
            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if data.nil?
                raise Appwrite::Exception.new('Missing required parameter: "data"')
            end

            path = '/database/collections/{collectionId}/documents'
                .gsub('{collectionId}', collection_id)

            params = {
                data: data,
                read: read,
                write: write,
                parentDocument: parent_document,
                parentProperty: parent_property,
                parentPropertyType: parent_property_type,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                params: params,
                headers: headers,
                response_type: Document
            )
        end

        # Get a document by its unique ID. This endpoint response returns a JSON
        # object with the document data.
        #
        # @param [string] collection_id Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/server/database#createCollection).
        # @param [string] document_id Document unique ID.
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
                params: params,
                headers: headers,
                response_type: Document
            )
        end

        # Update a document by its unique ID. Using the patch method you can pass
        # only specific fields that will get updated.
        #
        # @param [string] collection_id Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/server/database#createCollection).
        # @param [string] document_id Document unique ID.
        # @param [object] data Document data as JSON object.
        # @param [array] read An array of strings with read permissions. By default inherits the existing read permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [array] write An array of strings with write permissions. By default inherits the existing write permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
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
                params: params,
                headers: headers,
                response_type: Document
            )
        end

        # Delete a document by its unique ID. This endpoint deletes only the parent
        # documents, its attributes and relations to other documents. Child documents
        # **will not** be deleted.
        #
        # @param [string] collection_id Collection unique ID. You can create a new collection with validation rules using the Database service [server integration](/docs/server/database#createCollection).
        # @param [string] document_id Document unique ID.
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
                params: params,
                headers: headers,
            )
        end

    end 
end