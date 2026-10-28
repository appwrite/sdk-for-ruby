# frozen_string_literal: true

module Appwrite
    class Migrations < Service
        def initialize(client)
            @client = client
        end

        # List all migrations in the current project. This endpoint returns a list of
        # all migrations including their status, progress, and any errors that
        # occurred during the migration process.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: status, stage, source, destination, resources, resourceId, resourceInternalId, resourceType, parentResourceId, parentResourceInternalId, parentResourceType, destinationResourceId, destinationResourceInternalId, destinationResourceType, statusCounters, resourceData, errors
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [MigrationList]
        def list(
            queries: nil,
            search: nil,
            total: nil
        )
            api_path = '/migrations'

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
                response_type: Models::MigrationList
            )
        end

        # Migrate data from another Appwrite project to your current project. This
        # endpoint allows you to migrate resources like databases, collections,
        # documents, users, and files from an existing Appwrite project.
        #
        # @param [Array] resources List of resources to migrate
        # @param [String] endpoint Source Appwrite endpoint
        # @param [String] project_id Source Project ID
        # @param [String] api_key Source API Key
        # @param [OnDuplicate] on_duplicate Behavior when a row with an existing $id is encountered. &quot;fail&quot; (default): abort on first conflict. &quot;skip&quot;: silently ignore. &quot;overwrite&quot;: replace existing row.
        #
        # @return [Migration]
        def create_appwrite_migration(
            resources:,
            endpoint:,
            project_id:,
            api_key:,
            on_duplicate: nil
        )
            if resources.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resources"')
            end

            if endpoint.nil?
                raise Appwrite::Exception.new('Missing required parameter: "endpoint"')
            end

            if project_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if api_key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "apiKey"')
            end

            api_path = '/migrations/appwrite'

            api_params = {
                resources: resources,
                endpoint: endpoint,
                projectId: project_id,
                apiKey: api_key,
                onDuplicate: on_duplicate,
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
                response_type: Models::Migration
            )
        end

        # Export documents to a CSV file from your Appwrite database. This endpoint
        # allows you to export documents to a CSV file stored in a secure internal
        # bucket. You&#039;ll receive an email with a download link when the export is
        # complete.
        #
        # @param [String] database_id Database ID containing the source collection.
        # @param [String] collection_id Collection ID to export documents from.
        # @param [String] filename The name of the file to be created for the export, excluding the .csv extension.
        # @param [Array] columns List of attributes to export. If empty, all attributes will be exported. You can use the `*` wildcard to export all attributes from the collection.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK to filter documents to export. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] delimiter The character that separates each column value. Default is comma.
        # @param [String] enclosure The character that encloses each column value. Default is double quotes.
        # @param [String] escape The escape character for the enclosure character. Default is double quotes.
        # @param [] header Whether to include the header row with column names. Default is true.
        # @param [] notify Set to true to receive an email when the export is complete. Default is true.
        #
        # @return [Migration]
        def create_csv_export(
            database_id:,
            collection_id:,
            filename:,
            columns: nil,
            queries: nil,
            delimiter: nil,
            enclosure: nil,
            escape: nil,
            header: nil,
            notify: nil
        )
            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if filename.nil?
                raise Appwrite::Exception.new('Missing required parameter: "filename"')
            end

            api_path = '/migrations/csv/exports'

            api_params = {
                databaseId: database_id,
                collectionId: collection_id,
                filename: filename,
                columns: columns,
                queries: queries,
                delimiter: delimiter,
                enclosure: enclosure,
                escape: escape,
                header: header,
                notify: notify,
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
                response_type: Models::Migration
            )
        end

        # Import documents from a CSV file into your Appwrite database. This endpoint
        # allows you to import documents from a CSV file uploaded to Appwrite Storage
        # bucket.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).
        # @param [String] file_id File ID.
        # @param [String] database_id Database ID containing the target collection.
        # @param [String] collection_id Collection ID to import documents into.
        # @param [] internal_file Is the file stored in an internal bucket?
        # @param [OnDuplicate] on_duplicate Behavior when a row with an existing $id is encountered. &quot;fail&quot; (default): abort on first conflict. &quot;skip&quot;: silently ignore. &quot;overwrite&quot;: replace existing row.
        #
        # @return [Migration]
        def create_csv_import(
            bucket_id:,
            file_id:,
            database_id:,
            collection_id:,
            internal_file: nil,
            on_duplicate: nil
        )
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_path = '/migrations/csv/imports'

            api_params = {
                bucketId: bucket_id,
                fileId: file_id,
                databaseId: database_id,
                collectionId: collection_id,
                internalFile: internal_file,
                onDuplicate: on_duplicate,
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
                response_type: Models::Migration
            )
        end

        # Migrate data from a Firebase project to your Appwrite project. This
        # endpoint allows you to migrate resources like authentication and other
        # supported services from a Firebase project.
        #
        # @param [Array] resources List of resources to migrate
        # @param [String] service_account JSON of the Firebase service account credentials
        #
        # @return [Migration]
        def create_firebase_migration(
            resources:,
            service_account:
        )
            if resources.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resources"')
            end

            if service_account.nil?
                raise Appwrite::Exception.new('Missing required parameter: "serviceAccount"')
            end

            api_path = '/migrations/firebase'

            api_params = {
                resources: resources,
                serviceAccount: service_account,
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
                response_type: Models::Migration
            )
        end

        # Export documents to a JSON file from your Appwrite database. This endpoint
        # allows you to export documents to a JSON file stored in a secure internal
        # bucket. You&#039;ll receive an email with a download link when the export is
        # complete.
        #
        #
        # @param [String] database_id Database ID containing the source collection.
        # @param [String] collection_id Collection ID to export documents from.
        # @param [String] filename The name of the file to be created for the export, excluding the .json extension.
        # @param [Array] columns List of attributes to export. If empty, all attributes will be exported. You can use the `*` wildcard to export all attributes from the collection.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK to filter documents to export. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [] notify Set to true to receive an email when the export is complete. Default is true.
        #
        # @return [Migration]
        def create_json_export(
            database_id:,
            collection_id:,
            filename:,
            columns: nil,
            queries: nil,
            notify: nil
        )
            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if filename.nil?
                raise Appwrite::Exception.new('Missing required parameter: "filename"')
            end

            api_path = '/migrations/json/exports'

            api_params = {
                databaseId: database_id,
                collectionId: collection_id,
                filename: filename,
                columns: columns,
                queries: queries,
                notify: notify,
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
                response_type: Models::Migration
            )
        end

        # Import documents from a JSON file into your Appwrite database. This
        # endpoint allows you to import documents from a JSON file uploaded to
        # Appwrite Storage bucket.
        #
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).
        # @param [String] file_id File ID.
        # @param [String] database_id Database ID containing the target collection.
        # @param [String] collection_id Collection ID to import documents into.
        # @param [] internal_file Is the file stored in an internal bucket?
        # @param [OnDuplicate] on_duplicate Behavior when a row with an existing $id is encountered. &quot;fail&quot; (default): abort on first conflict. &quot;skip&quot;: silently ignore. &quot;overwrite&quot;: replace existing row.
        #
        # @return [Migration]
        def create_json_import(
            bucket_id:,
            file_id:,
            database_id:,
            collection_id:,
            internal_file: nil,
            on_duplicate: nil
        )
            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            api_path = '/migrations/json/imports'

            api_params = {
                bucketId: bucket_id,
                fileId: file_id,
                databaseId: database_id,
                collectionId: collection_id,
                internalFile: internal_file,
                onDuplicate: on_duplicate,
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
                response_type: Models::Migration
            )
        end

        # Migrate data from an NHost project to your Appwrite project. This endpoint
        # allows you to migrate resources like authentication, databases, and other
        # supported services from an NHost project.
        #
        # @param [Array] resources List of resources to migrate
        # @param [String] subdomain Source&#039;s Subdomain
        # @param [String] region Source&#039;s Region
        # @param [String] admin_secret Source&#039;s Admin Secret
        # @param [String] database Source&#039;s Database Name
        # @param [String] username Source&#039;s Database Username
        # @param [String] password Source&#039;s Database Password
        # @param [Integer] port Source&#039;s Database Port
        #
        # @return [Migration]
        def create_n_host_migration(
            resources:,
            subdomain:,
            region:,
            admin_secret:,
            database:,
            username:,
            password:,
            port: nil
        )
            if resources.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resources"')
            end

            if subdomain.nil?
                raise Appwrite::Exception.new('Missing required parameter: "subdomain"')
            end

            if region.nil?
                raise Appwrite::Exception.new('Missing required parameter: "region"')
            end

            if admin_secret.nil?
                raise Appwrite::Exception.new('Missing required parameter: "adminSecret"')
            end

            if database.nil?
                raise Appwrite::Exception.new('Missing required parameter: "database"')
            end

            if username.nil?
                raise Appwrite::Exception.new('Missing required parameter: "username"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            api_path = '/migrations/nhost'

            api_params = {
                resources: resources,
                subdomain: subdomain,
                region: region,
                adminSecret: admin_secret,
                database: database,
                username: username,
                password: password,
                port: port,
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
                response_type: Models::Migration
            )
        end

        # Migrate data from a Supabase project to your Appwrite project. This
        # endpoint allows you to migrate resources like authentication, databases,
        # and other supported services from a Supabase project.
        #
        # @param [Array] resources List of resources to migrate
        # @param [String] endpoint Source&#039;s Supabase Endpoint
        # @param [String] api_key Source&#039;s API Key
        # @param [String] database_host Source&#039;s Database Host
        # @param [String] username Source&#039;s Database Username
        # @param [String] password Source&#039;s Database Password
        # @param [Integer] port Source&#039;s Database Port
        #
        # @return [Migration]
        def create_supabase_migration(
            resources:,
            endpoint:,
            api_key:,
            database_host:,
            username:,
            password:,
            port: nil
        )
            if resources.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resources"')
            end

            if endpoint.nil?
                raise Appwrite::Exception.new('Missing required parameter: "endpoint"')
            end

            if api_key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "apiKey"')
            end

            if database_host.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseHost"')
            end

            if username.nil?
                raise Appwrite::Exception.new('Missing required parameter: "username"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            api_path = '/migrations/supabase'

            api_params = {
                resources: resources,
                endpoint: endpoint,
                apiKey: api_key,
                databaseHost: database_host,
                username: username,
                password: password,
                port: port,
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
                response_type: Models::Migration
            )
        end

        # Get a migration by its unique ID. This endpoint returns detailed
        # information about a specific migration including its current status,
        # progress, and any errors that occurred during the migration process.
        #
        # @param [String] migration_id Migration unique ID.
        #
        # @return [Migration]
        def get(
            migration_id:
        )
            if migration_id.nil? || migration_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "migrationId"')
            end

            api_path = '/migrations/{migrationId}'
                .gsub('{migrationId}', @client.encode_path(migration_id))

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
                response_type: Models::Migration
            )
        end

        # Retry a failed migration. This endpoint allows you to retry a migration
        # that has previously failed.
        #
        # @param [String] migration_id Migration unique ID.
        #
        # @return [Migration]
        def retry(
            migration_id:
        )
            if migration_id.nil? || migration_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "migrationId"')
            end

            api_path = '/migrations/{migrationId}'
                .gsub('{migrationId}', @client.encode_path(migration_id))

            api_params = {}

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
                response_type: Models::Migration
            )
        end

        # Delete a migration by its unique ID. This endpoint allows you to remove a
        # migration from your project&#039;s migration history.
        #
        # @param [String] migration_id Migration ID.
        #
        # @return []
        def delete(
            migration_id:
        )
            if migration_id.nil? || migration_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "migrationId"')
            end

            api_path = '/migrations/{migrationId}'
                .gsub('{migrationId}', @client.encode_path(migration_id))

            api_params = {}

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
            )
        end
    end
end
