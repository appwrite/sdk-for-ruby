#frozen_string_literal: true

module Appwrite
    class VectorsDB < Service

        def initialize(client)
            @client = client
        end

        # 
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: name
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [DatabaseList]
        def list(queries: nil, search: nil, total: nil)
            api_path = '/vectorsdb'

            api_params = {
                queries: queries,
                search: search,
                total: total,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DatabaseList
            )
        end

        # 
        #
        # @param [String] database_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is the database enabled? When set to 'disabled', users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        #
        # @return [Database]
        def create(database_id:, name:, enabled: nil)
            api_path = '/vectorsdb'

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                databaseId: database_id,
                name: name,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Database
            )
        end

        # 
        #
        # @param [Array] texts Array of text to generate embeddings.
        # @param [Model] model The embedding model to use for generating vector embeddings.
        #
        # @return [EmbeddingList]
        def create_text_embeddings(texts:, model: nil)
            api_path = '/vectorsdb/embeddings/text'

            if texts.nil?
              raise Appwrite::Exception.new('Missing required parameter: "texts"')
            end

            api_params = {
                texts: texts,
                model: model,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::EmbeddingList
            )
        end

        # 
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries).
        #
        # @return [TransactionList]
        def list_transactions(queries: nil)
            api_path = '/vectorsdb/transactions'

            api_params = {
                queries: queries,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::TransactionList
            )
        end

        # 
        #
        # @param [Integer] ttl Seconds before the transaction expires.
        #
        # @return [Transaction]
        def create_transaction(ttl: nil)
            api_path = '/vectorsdb/transactions'

            api_params = {
                ttl: ttl,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # 
        #
        # @param [String] transaction_id Transaction ID.
        #
        # @return [Transaction]
        def get_transaction(transaction_id:)
            api_path = '/vectorsdb/transactions/{transactionId}'
                .gsub('{transactionId}', transaction_id)

            if transaction_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "transactionId"')
            end

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # 
        #
        # @param [String] transaction_id Transaction ID.
        # @param [] commit Commit transaction?
        # @param [] rollback Rollback transaction?
        #
        # @return [Transaction]
        def update_transaction(transaction_id:, commit: nil, rollback: nil)
            api_path = '/vectorsdb/transactions/{transactionId}'
                .gsub('{transactionId}', transaction_id)

            if transaction_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "transactionId"')
            end

            api_params = {
                commit: commit,
                rollback: rollback,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # 
        #
        # @param [String] transaction_id Transaction ID.
        #
        # @return []
        def delete_transaction(transaction_id:)
            api_path = '/vectorsdb/transactions/{transactionId}'
                .gsub('{transactionId}', transaction_id)

            if transaction_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "transactionId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # 
        #
        # @param [String] transaction_id Transaction ID.
        # @param [Array] operations Array of staged operations.
        #
        # @return [Transaction]
        def create_operations(transaction_id:, operations: nil)
            api_path = '/vectorsdb/transactions/{transactionId}/operations'
                .gsub('{transactionId}', transaction_id)

            if transaction_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "transactionId"')
            end

            api_params = {
                operations: operations,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        #
        # @return [Database]
        def get(database_id:)
            api_path = '/vectorsdb/{databaseId}'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Database
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is database enabled? When set to 'disabled', users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        #
        # @return [Database]
        def update(database_id:, name:, enabled: nil)
            api_path = '/vectorsdb/{databaseId}'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                name: name,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Database
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        #
        # @return []
        def delete(database_id:)
            api_path = '/vectorsdb/{databaseId}'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, documentSecurity
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [VectorsdbCollectionList]
        def list_collections(database_id:, queries: nil, search: nil, total: nil)
            api_path = '/vectorsdb/{databaseId}/collections'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                queries: queries,
                search: search,
                total: total,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollectionList
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Collection name. Max length: 128 chars.
        # @param [Integer] dimension Embedding dimension.
        # @param [Array] permissions An array of permissions strings. By default, no user is granted with any permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] document_security Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is collection enabled? When set to 'disabled', users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.
        #
        # @return [VectorsdbCollection]
        def create_collection(database_id:, collection_id:, name:, dimension:, permissions: nil, document_security: nil, enabled: nil)
            api_path = '/vectorsdb/{databaseId}/collections'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if dimension.nil?
              raise Appwrite::Exception.new('Missing required parameter: "dimension"')
            end

            api_params = {
                collectionId: collection_id,
                name: name,
                dimension: dimension,
                permissions: permissions,
                documentSecurity: document_security,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollection
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        #
        # @return [VectorsdbCollection]
        def get_collection(database_id:, collection_id:)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollection
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] name Collection name. Max length: 128 chars.
        # @param [Integer] dimension Embedding dimensions.
        # @param [Array] permissions An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] document_security Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is collection enabled? When set to 'disabled', users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.
        #
        # @return [VectorsdbCollection]
        def update_collection(database_id:, collection_id:, name:, dimension: nil, permissions: nil, document_security: nil, enabled: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                name: name,
                dimension: dimension,
                permissions: permissions,
                documentSecurity: document_security,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollection
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        #
        # @return []
        def delete_collection(database_id:, collection_id:)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] transaction_id Transaction ID to read uncommitted changes within the transaction.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        # @param [Integer] ttl TTL (seconds) for cached responses when caching is enabled for select queries. Must be between 0 and 86400 (24 hours).
        #
        # @return [DocumentList]
        def list_documents(database_id:, collection_id:, queries: nil, transaction_id: nil, total: nil, ttl: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {
                queries: queries,
                transactionId: transaction_id,
                total: total,
                ttl: ttl,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.
        # @param [String] document_id Document ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [Hash] data Document data as JSON object.
        # @param [Array] permissions An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Document]
        def create_document(database_id:, collection_id:, document_id:, data:, permissions: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
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

            api_params = {
                documentId: document_id,
                data: data,
                permissions: permissions,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.
        # @param [Array] documents Array of documents data as JSON objects.
        #
        # @return [DocumentList]
        def create_documents(database_id:, collection_id:, documents:)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if documents.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documents"')
            end

            api_params = {
                documents: documents,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [Array] documents Array of document data as JSON objects. May contain partial documents.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [DocumentList]
        def upsert_documents(database_id:, collection_id:, documents:, transaction_id: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if documents.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documents"')
            end

            api_params = {
                documents: documents,
                transactionId: transaction_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [Hash] data Document data as JSON object. Include only attribute and value pairs to be updated.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [DocumentList]
        def update_documents(database_id:, collection_id:, data: nil, queries: nil, transaction_id: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {
                data: data,
                queries: queries,
                transactionId: transaction_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [DocumentList]
        def delete_documents(database_id:, collection_id:, queries: nil, transaction_id: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {
                queries: queries,
                transactionId: transaction_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] document_id Document ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] transaction_id Transaction ID to read uncommitted changes within the transaction.
        #
        # @return [Document]
        def get_document(database_id:, collection_id:, document_id:, queries: nil, transaction_id: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            api_params = {
                queries: queries,
                transactionId: transaction_id,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [Hash] data Document data as JSON object. Include all required fields of the document to be created or updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [Document]
        def upsert_document(database_id:, collection_id:, document_id:, data: nil, permissions: nil, transaction_id: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            api_params = {
                data: data,
                permissions: permissions,
                transactionId: transaction_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [Hash] data Document data as JSON object. Include only fields and value pairs to be updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [Document]
        def update_document(database_id:, collection_id:, document_id:, data: nil, permissions: nil, transaction_id: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            api_params = {
                data: data,
                permissions: permissions,
                transactionId: transaction_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] document_id Document ID.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return []
        def delete_document(database_id:, collection_id:, document_id:, transaction_id: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            api_params = {
                transactionId: transaction_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, type, status, attributes, error
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [IndexList]
        def list_indexes(database_id:, collection_id:, queries: nil, total: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/indexes'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::IndexList
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        # @param [VectorsDBIndexType] type Index type.
        # @param [Array] attributes Array of attributes to index. Maximum of 100 attributes are allowed, each 32 characters long.
        # @param [Array] orders Array of index orders. Maximum of 100 orders are allowed.
        # @param [Array] lengths Length of index. Maximum of 100
        #
        # @return [Index]
        def create_index(database_id:, collection_id:, key:, type:, attributes:, orders: nil, lengths: nil)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/indexes'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
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

            api_params = {
                key: key,
                type: type,
                attributes: attributes,
                orders: orders,
                lengths: lengths,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Index
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        #
        # @return [Index]
        def get_index(database_id:, collection_id:, key:)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/indexes/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Index
            )
        end

        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        #
        # @return []
        def delete_index(database_id:, collection_id:, key:)
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/indexes/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

    end 
end