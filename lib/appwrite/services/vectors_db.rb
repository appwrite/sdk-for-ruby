# frozen_string_literal: true

module Appwrite
    class VectorsDB < Service
        def initialize(client)
            @client = client
        end

        # Get a list of all databases from the current Appwrite project. You can use
        # the search parameter to filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: name
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [DatabaseList]
        def list(
            queries: nil,
            total: nil
        )
            api_path = '/vectorsdb'

            api_params = {
                queries: queries,
                total: total,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DatabaseList
            )
        end

        # Create a new Database.
        #
        #
        # @param [String] database_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is the database enabled? When set to &#039;disabled&#039;, users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        # @param [String] specification Database specification. Defaults to `serverless`, which creates the database on the shared pool. Any other value provisions a dedicated database on that specification.
        # @param [Integer] replicas Number of high availability replicas (0-5) for the dedicated database backing this database. Requires a dedicated `specification`; must be 0 for a serverless database. High availability is enabled when greater than 0.
        # @param [String] sync_mode Replication sync mode for the dedicated database backing this database. Requires a dedicated `specification`; the mode is only in force once there is at least one replica. Allowed values: async, sync, quorum.
        #
        # @return [Database]
        def create(
            database_id:,
            name:,
            enabled: nil,
            specification: nil,
            replicas: nil,
            sync_mode: nil
        )
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
                specification: specification,
                replicas: replicas,
                syncMode: sync_mode,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Database
            )
        end

        # List the dedicated database specifications available on the current plan.
        # Each specification reports its resource limits, pricing, and whether it is
        # enabled for the organization.
        #
        #
        # @return [DedicatedDatabaseSpecificationList]
        def list_specifications()
            api_path = '/vectorsdb/specifications'

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DedicatedDatabaseSpecificationList
            )
        end

        # List transactions across all databases.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries).
        #
        # @return [TransactionList]
        def list_transactions(
            queries: nil
        )
            api_path = '/vectorsdb/transactions'

            api_params = {
                queries: queries,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::TransactionList
            )
        end

        # Create a new transaction.
        #
        # @param [Integer] ttl Seconds before the transaction expires.
        #
        # @return [Transaction]
        def create_transaction(
            ttl: nil
        )
            api_path = '/vectorsdb/transactions'

            api_params = {
                ttl: ttl,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # Get a transaction by its unique ID.
        #
        # @param [String] transaction_id Transaction ID.
        #
        # @return [Transaction]
        def get_transaction(
            transaction_id:
        )
            api_path = '/vectorsdb/transactions/{transactionId}'
                .gsub('{transactionId}', transaction_id)

            if transaction_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "transactionId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # Update a transaction, to either commit or roll back its operations.
        #
        # @param [String] transaction_id Transaction ID.
        # @param [] commit Commit transaction?
        # @param [] rollback Rollback transaction?
        #
        # @return [Transaction]
        def update_transaction(
            transaction_id:,
            commit: nil,
            rollback: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # Delete a transaction by its unique ID.
        #
        # @param [String] transaction_id Transaction ID.
        #
        # @return []
        def delete_transaction(
            transaction_id:
        )
            api_path = '/vectorsdb/transactions/{transactionId}'
                .gsub('{transactionId}', transaction_id)

            if transaction_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "transactionId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Create multiple operations in a single transaction.
        #
        # @param [String] transaction_id Transaction ID.
        # @param [Array] operations Array of staged operations.
        #
        # @return [Transaction]
        def create_operations(
            transaction_id:,
            operations: nil
        )
            api_path = '/vectorsdb/transactions/{transactionId}/operations'
                .gsub('{transactionId}', transaction_id)

            if transaction_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "transactionId"')
            end

            api_params = {
                operations: operations,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Transaction
            )
        end

        # Get a database by its unique ID. This endpoint response returns a JSON
        # object with the database metadata.
        #
        # @param [String] database_id Database ID.
        #
        # @return [Database]
        def get(
            database_id:
        )
            api_path = '/vectorsdb/{databaseId}'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Database
            )
        end

        # Update a database by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is database enabled? When set to &#039;disabled&#039;, users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        # @param [String] specification Database specification. Resizing between dedicated specifications changes cpu, memory, storage and the connection ceiling via a rolling cutover with zero downtime. Moving a `serverless` database onto a dedicated specification is a data migration, not a resize.
        # @param [Integer] replicas Number of high availability replicas (0-5) for the dedicated database backing this database. Only valid when the database is backed by a dedicated specification. High availability is enabled when greater than 0.
        # @param [String] sync_mode Replication sync mode for the dedicated database backing this database. Only valid when the database is backed by a dedicated specification; the mode is only in force once there is at least one replica. Allowed values: async, sync, quorum.
        #
        # @return [Database]
        def update(
            database_id:,
            name:,
            enabled: nil,
            specification: nil,
            replicas: nil,
            sync_mode: nil
        )
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
                specification: specification,
                replicas: replicas,
                syncMode: sync_mode,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Database
            )
        end

        # Delete a database by its unique ID. Only API keys with with databases.write
        # scope can delete a database.
        #
        # @param [String] database_id Database ID.
        #
        # @return []
        def delete(
            database_id:
        )
            api_path = '/vectorsdb/{databaseId}'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get a list of all collections that belong to the provided databaseId. You
        # can use the search parameter to filter your results.
        #
        # @param [String] database_id Database ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, documentSecurity
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [VectorsdbCollectionList]
        def list_collections(
            database_id:,
            queries: nil,
            search: nil,
            total: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollectionList
            )
        end

        # Create a new Collection. Before using this route, you should create a new
        # database resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Collection name. Max length: 128 chars.
        # @param [Integer] dimension Embedding dimension.
        # @param [Array] permissions An array of permissions strings. By default, no user is granted with any permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] document_security Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is collection enabled? When set to &#039;disabled&#039;, users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.
        #
        # @return [VectorsdbCollection]
        def create_collection(
            database_id:,
            collection_id:,
            name:,
            dimension:,
            permissions: nil,
            document_security: nil,
            enabled: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollection
            )
        end

        # Get a collection by its unique ID. This endpoint response returns a JSON
        # object with the collection metadata.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        #
        # @return [VectorsdbCollection]
        def get_collection(
            database_id:,
            collection_id:
        )
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollection
            )
        end

        # Update a collection by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] name Collection name. Max length: 128 chars.
        # @param [Integer] dimension Embedding dimensions.
        # @param [Array] permissions An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] document_security Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is collection enabled? When set to &#039;disabled&#039;, users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.
        #
        # @return [VectorsdbCollection]
        def update_collection(
            database_id:,
            collection_id:,
            name:,
            dimension: nil,
            permissions: nil,
            document_security: nil,
            enabled: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VectorsdbCollection
            )
        end

        # Delete a collection by its unique ID. Only users with write permissions
        # have access to delete this resource.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        #
        # @return []
        def delete_collection(
            database_id:,
            collection_id:
        )
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get a list of all the user&#039;s documents in a given collection. You can use
        # the query params to filter your results.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 524288 characters long.
        # @param [String] transaction_id Transaction ID to read uncommitted changes within the transaction.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        # @param [Integer] ttl TTL (seconds) for cached responses when caching is enabled for select queries. Must be between 0 and 86400 (24 hours).
        #
        # @return [DocumentList]
        def list_documents(
            database_id:,
            collection_id:,
            queries: nil,
            transaction_id: nil,
            total: nil,
            ttl: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # Create a new Document. Before using this route, you should create a new
        # collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.
        # @param [String] document_id Document ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [Hash] data Document data as JSON object.
        # @param [Array] permissions An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [Document]
        def create_document(
            database_id:,
            collection_id:,
            document_id:,
            data:,
            permissions: nil,
            transaction_id: nil
        )
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
                transactionId: transaction_id,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # Create new Documents. Before using this route, you should create a new
        # collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.
        # @param [Array] documents Array of documents data as JSON objects.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [DocumentList]
        def create_documents(
            database_id:,
            collection_id:,
            documents:,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # Create or update Documents. Before using this route, you should create a
        # new collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
        # API or directly from your database console.
        #
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [Array] documents Array of document data as JSON objects. May contain partial documents.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [DocumentList]
        def upsert_documents(
            database_id:,
            collection_id:,
            documents:,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # Update all documents that match your queries, if no queries are submitted
        # then all documents are updated. You can pass only specific fields to be
        # updated.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [Hash] data Document data as JSON object. Include only attribute and value pairs to be updated.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [DocumentList]
        def update_documents(
            database_id:,
            collection_id:,
            data: nil,
            queries: nil,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # Bulk delete documents using queries, if no queries are passed then all
        # documents are deleted.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [DocumentList]
        def delete_documents(
            database_id:,
            collection_id:,
            queries: nil,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # Get a list of all the user&#039;s documents in a given collection using a POST
        # request. This behaves identically to the list documents endpoint but
        # accepts the queries in the request body, allowing much larger `queries`
        # arrays than can fit in a URL query string.
        #
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 524288 characters long.
        # @param [String] transaction_id Transaction ID to read uncommitted changes within the transaction.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        # @param [Integer] ttl TTL (seconds) for cached responses when caching is enabled for select queries. Must be between 0 and 86400 (24 hours).
        #
        # @return [DocumentList]
        def create_query(
            database_id:,
            collection_id:,
            queries: nil,
            transaction_id: nil,
            total: nil,
            ttl: nil
        )
            api_path = '/vectorsdb/{databaseId}/collections/{collectionId}/documents/query'
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        # Get a document by its unique ID. This endpoint response returns a JSON
        # object with the document data.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] document_id Document ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] transaction_id Transaction ID to read uncommitted changes within the transaction.
        #
        # @return [Document]
        def get_document(
            database_id:,
            collection_id:,
            document_id:,
            queries: nil,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # Create or update a Document. Before using this route, you should create a
        # new collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [Hash] data Document data as JSON object. Include all required fields of the document to be created or updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [Document]
        def upsert_document(
            database_id:,
            collection_id:,
            document_id:,
            data: nil,
            permissions: nil,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # Update a document by its unique ID. Using the patch method you can pass
        # only specific fields that will get updated.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [Hash] data Document data as JSON object. Include only fields and value pairs to be updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return [Document]
        def update_document(
            database_id:,
            collection_id:,
            document_id:,
            data: nil,
            permissions: nil,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Document
            )
        end

        # Delete a document by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] document_id Document ID.
        # @param [String] transaction_id Transaction ID for staging the operation.
        #
        # @return []
        def delete_document(
            database_id:,
            collection_id:,
            document_id:,
            transaction_id: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # List indexes in the collection.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, type, status, attributes, error
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [IndexList]
        def list_indexes(
            database_id:,
            collection_id:,
            queries: nil,
            total: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::IndexList
            )
        end

        # Creates an index on the attributes listed. Your index should include all
        # the attributes you will query in a single request.
        # Attributes can be `key`, `fulltext`, and `unique`.
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
        def create_index(
            database_id:,
            collection_id:,
            key:,
            type:,
            attributes:,
            orders: nil,
            lengths: nil
        )
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Index
            )
        end

        # Get index by ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        #
        # @return [Index]
        def get_index(
            database_id:,
            collection_id:,
            key:
        )
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

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Index
            )
        end

        # Delete an index.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        #
        # @return []
        def delete_index(
            database_id:,
            collection_id:,
            key:
        )
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

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Trigger a manual failover for a dedicated database with high availability
        # enabled. Promotes a replica to primary. The failover runs asynchronously;
        # poll the database document for status updates. A database left
        # mid-operation also accepts this call as a repair once nothing is driving
        # the operation it is stuck in. Repairing a failover that did not finish, a
        # `failed` database, a stranded upgrade or migrate, or a stranded compute
        # resize additionally requires `targetReplicaId` to name the member to
        # promote, because the default target may be the member that operation
        # already promoted.
        #
        # @param [String] database_id Database ID.
        # @param [String] target_replica_id Target replica ID to promote. If not specified, the healthiest replica is selected.
        #
        # @return [DedicatedDatabase]
        def create_failover(
            database_id:,
            target_replica_id: nil
        )
            api_path = '/vectorsdb/{databaseId}/failovers'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                targetReplicaId: target_replica_id,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DedicatedDatabase
            )
        end

        # List the lifecycle operations recorded for a dedicated database, newest
        # first. Every provision, update, restore, backup and replication action is
        # recorded here with its outcome, including an attempt that was abandoned
        # because another worker took over the database.
        #
        # @param [String] database_id Database ID.
        # @param [String] status Filter by operation status.
        # @param [Integer] limit Maximum number of operations to return.
        # @param [Integer] offset Number of operations to skip.
        #
        # @return [DedicatedDatabaseOperationList]
        def list_operations(
            database_id:,
            status: nil,
            limit: nil,
            offset: nil
        )
            api_path = '/vectorsdb/{databaseId}/operations'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                status: status,
                limit: limit,
                offset: offset,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DedicatedDatabaseOperationList
            )
        end

        # Get high availability status for a dedicated database. Returns replica
        # statuses, replication lag, and sync mode.
        #
        # @param [String] database_id Database ID.
        #
        # @return [DedicatedDatabaseReplicas]
        def get_replicas(
            database_id:
        )
            api_path = '/vectorsdb/{databaseId}/replicas'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DedicatedDatabaseReplicas
            )
        end

        # Get real-time health and status information for a dedicated database.
        # Returns health status, readiness, uptime, connection info, replica status,
        # and volume information.
        #
        # @param [String] database_id Database ID.
        #
        # @return [DatabaseStatus]
        def get_status(
            database_id:
        )
            api_path = '/vectorsdb/{databaseId}/status'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DatabaseStatus
            )
        end
    end
end
