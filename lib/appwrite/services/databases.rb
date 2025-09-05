#frozen_string_literal: true

module Appwrite
    class Databases < Service

        def initialize(client)
            @client = client
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.list` instead.
        #
        # Get a list of all databases from the current Appwrite project. You can use
        # the search parameter to filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [DatabaseList]
        def list(queries: nil, search: nil)
            api_path = '/databases'

            api_params = {
                queries: queries,
                search: search,
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.create` instead.
        #
        # Create a new Database.
        # 
        #
        # @param [String] database_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is the database enabled? When set to 'disabled', users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        #
        # @return [Database]
        def create(database_id:, name:, enabled: nil)
            api_path = '/databases'

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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.get` instead.
        #
        # Get a database by its unique ID. This endpoint response returns a JSON
        # object with the database metadata.
        #
        # @param [String] database_id Database ID.
        #
        # @return [Database]
        def get(database_id:)
            api_path = '/databases/{databaseId}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.update` instead.
        #
        # Update a database by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is database enabled? When set to 'disabled', users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        #
        # @return [Database]
        def update(database_id:, name:, enabled: nil)
            api_path = '/databases/{databaseId}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.delete` instead.
        #
        # Delete a database by its unique ID. Only API keys with with databases.write
        # scope can delete a database.
        #
        # @param [String] database_id Database ID.
        #
        # @return []
        def delete(database_id:)
            api_path = '/databases/{databaseId}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.listTables` instead.
        #
        # Get a list of all collections that belong to the provided databaseId. You
        # can use the search parameter to filter your results.
        #
        # @param [String] database_id Database ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, documentSecurity
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [CollectionList]
        def list_collections(database_id:, queries: nil, search: nil)
            api_path = '/databases/{databaseId}/collections'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::CollectionList
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createTable` instead.
        #
        # Create a new Collection. Before using this route, you should create a new
        # database resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Collection name. Max length: 128 chars.
        # @param [Array] permissions An array of permissions strings. By default, no user is granted with any permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] document_security Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is collection enabled? When set to 'disabled', users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.
        #
        # @return [Collection]
        def create_collection(database_id:, collection_id:, name:, permissions: nil, document_security: nil, enabled: nil)
            api_path = '/databases/{databaseId}/collections'
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

            api_params = {
                collectionId: collection_id,
                name: name,
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
                response_type: Models::Collection
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.getTable` instead.
        #
        # Get a collection by its unique ID. This endpoint response returns a JSON
        # object with the collection metadata.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        #
        # @return [Collection]
        def get_collection(database_id:, collection_id:)
            api_path = '/databases/{databaseId}/collections/{collectionId}'
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
                response_type: Models::Collection
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateTable` instead.
        #
        # Update a collection by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] name Collection name. Max length: 128 chars.
        # @param [Array] permissions An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] document_security Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is collection enabled? When set to 'disabled', users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.
        #
        # @return [Collection]
        def update_collection(database_id:, collection_id:, name:, permissions: nil, document_security: nil, enabled: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}'
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
                response_type: Models::Collection
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.deleteTable` instead.
        #
        # Delete a collection by its unique ID. Only users with write permissions
        # have access to delete this resource.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        #
        # @return []
        def delete_collection(database_id:, collection_id:)
            api_path = '/databases/{databaseId}/collections/{collectionId}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.listColumns` instead.
        #
        # List attributes in the collection.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, type, size, required, array, status, error
        #
        # @return [AttributeList]
        def list_attributes(database_id:, collection_id:, queries: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes'
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
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeList
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createBooleanColumn` instead.
        #
        # Create a boolean attribute.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeBoolean]
        def create_boolean_attribute(database_id:, collection_id:, key:, required:, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/boolean'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeBoolean
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateBooleanColumn` instead.
        #
        # Update a boolean attribute. Changing the `default` value will not update
        # already existing documents.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [String] new_key New attribute key.
        #
        # @return [AttributeBoolean]
        def update_boolean_attribute(database_id:, collection_id:, key:, required:, default:, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/boolean/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeBoolean
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createDatetimeColumn` instead.
        #
        # Create a date time attribute according to the ISO 8601 standard.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value for the attribute in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeDatetime]
        def create_datetime_attribute(database_id:, collection_id:, key:, required:, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/datetime'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeDatetime
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateDatetimeColumn` instead.
        #
        # Update a date time attribute. Changing the `default` value will not update
        # already existing documents.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [String] new_key New attribute key.
        #
        # @return [AttributeDatetime]
        def update_datetime_attribute(database_id:, collection_id:, key:, required:, default:, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/datetime/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeDatetime
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createEmailColumn` instead.
        #
        # Create an email attribute.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeEmail]
        def create_email_attribute(database_id:, collection_id:, key:, required:, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/email'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeEmail
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateEmailColumn` instead.
        #
        # Update an email attribute. Changing the `default` value will not update
        # already existing documents.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeEmail]
        def update_email_attribute(database_id:, collection_id:, key:, required:, default:, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/email/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeEmail
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createEnumColumn` instead.
        #
        # Create an enum attribute. The `elements` param acts as a white-list of
        # accepted values for this attribute. 
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [Array] elements Array of enum values.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeEnum]
        def create_enum_attribute(database_id:, collection_id:, key:, elements:, required:, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/enum'
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

            if elements.nil?
              raise Appwrite::Exception.new('Missing required parameter: "elements"')
            end

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                elements: elements,
                required: required,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeEnum
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateEnumColumn` instead.
        #
        # Update an enum attribute. Changing the `default` value will not update
        # already existing documents.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [Array] elements Updated list of enum values.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeEnum]
        def update_enum_attribute(database_id:, collection_id:, key:, elements:, required:, default:, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/enum/{key}'
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

            if elements.nil?
              raise Appwrite::Exception.new('Missing required parameter: "elements"')
            end

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                elements: elements,
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeEnum
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createFloatColumn` instead.
        #
        # Create a float attribute. Optionally, minimum and maximum values can be
        # provided.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Float] min Minimum value.
        # @param [Float] max Maximum value.
        # @param [Float] default Default value. Cannot be set when required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeFloat]
        def create_float_attribute(database_id:, collection_id:, key:, required:, min: nil, max: nil, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/float'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                min: min,
                max: max,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeFloat
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateFloatColumn` instead.
        #
        # Update a float attribute. Changing the `default` value will not update
        # already existing documents.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Float] default Default value. Cannot be set when required.
        # @param [Float] min Minimum value.
        # @param [Float] max Maximum value.
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeFloat]
        def update_float_attribute(database_id:, collection_id:, key:, required:, default:, min: nil, max: nil, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/float/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                min: min,
                max: max,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeFloat
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createIntegerColumn` instead.
        #
        # Create an integer attribute. Optionally, minimum and maximum values can be
        # provided.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Integer] min Minimum value
        # @param [Integer] max Maximum value
        # @param [Integer] default Default value. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeInteger]
        def create_integer_attribute(database_id:, collection_id:, key:, required:, min: nil, max: nil, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/integer'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                min: min,
                max: max,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeInteger
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateIntegerColumn` instead.
        #
        # Update an integer attribute. Changing the `default` value will not update
        # already existing documents.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Integer] default Default value. Cannot be set when attribute is required.
        # @param [Integer] min Minimum value
        # @param [Integer] max Maximum value
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeInteger]
        def update_integer_attribute(database_id:, collection_id:, key:, required:, default:, min: nil, max: nil, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/integer/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                min: min,
                max: max,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeInteger
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createIpColumn` instead.
        #
        # Create IP address attribute.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeIp]
        def create_ip_attribute(database_id:, collection_id:, key:, required:, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/ip'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeIp
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateIpColumn` instead.
        #
        # Update an ip attribute. Changing the `default` value will not update
        # already existing documents.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value. Cannot be set when attribute is required.
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeIp]
        def update_ip_attribute(database_id:, collection_id:, key:, required:, default:, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/ip/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeIp
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createLineColumn` instead.
        #
        # Create a geometric line attribute.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Array] default Default value for attribute when not provided, two-dimensional array of coordinate pairs, [[longitude, latitude], [longitude, latitude], …], listing the vertices of the line in order. Cannot be set when attribute is required.
        #
        # @return [AttributeLine]
        def create_line_attribute(database_id:, collection_id:, key:, required:, default: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/line'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeLine
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateLineColumn` instead.
        #
        # Update a line attribute. Changing the `default` value will not update
        # already existing documents.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Array] default Default value for attribute when not provided, two-dimensional array of coordinate pairs, [[longitude, latitude], [longitude, latitude], …], listing the vertices of the line in order. Cannot be set when attribute is required.
        # @param [String] new_key New attribute key.
        #
        # @return [AttributeLine]
        def update_line_attribute(database_id:, collection_id:, key:, required:, default: nil, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/line/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeLine
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createPointColumn` instead.
        #
        # Create a geometric point attribute.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Array] default Default value for attribute when not provided, array of two numbers [longitude, latitude], representing a single coordinate. Cannot be set when attribute is required.
        #
        # @return [AttributePoint]
        def create_point_attribute(database_id:, collection_id:, key:, required:, default: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/point'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributePoint
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updatePointColumn` instead.
        #
        # Update a point attribute. Changing the `default` value will not update
        # already existing documents.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Array] default Default value for attribute when not provided, array of two numbers [longitude, latitude], representing a single coordinate. Cannot be set when attribute is required.
        # @param [String] new_key New attribute key.
        #
        # @return [AttributePoint]
        def update_point_attribute(database_id:, collection_id:, key:, required:, default: nil, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/point/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributePoint
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createPolygonColumn` instead.
        #
        # Create a geometric polygon attribute.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Array] default Default value for attribute when not provided, three-dimensional array where the outer array holds one or more linear rings, [[[longitude, latitude], …], …], the first ring is the exterior boundary, any additional rings are interior holes, and each ring must start and end with the same coordinate pair. Cannot be set when attribute is required.
        #
        # @return [AttributePolygon]
        def create_polygon_attribute(database_id:, collection_id:, key:, required:, default: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/polygon'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributePolygon
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updatePolygonColumn` instead.
        #
        # Update a polygon attribute. Changing the `default` value will not update
        # already existing documents.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [Array] default Default value for attribute when not provided, three-dimensional array where the outer array holds one or more linear rings, [[[longitude, latitude], …], …], the first ring is the exterior boundary, any additional rings are interior holes, and each ring must start and end with the same coordinate pair. Cannot be set when attribute is required.
        # @param [String] new_key New attribute key.
        #
        # @return [AttributePolygon]
        def update_polygon_attribute(database_id:, collection_id:, key:, required:, default: nil, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/polygon/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributePolygon
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createRelationshipColumn` instead.
        #
        # Create relationship attribute. [Learn more about relationship
        # attributes](https://appwrite.io/docs/databases-relationships#relationship-attributes).
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] related_collection_id Related Collection ID.
        # @param [RelationshipType] type Relation type
        # @param [] two_way Is Two Way?
        # @param [String] key Attribute Key.
        # @param [String] two_way_key Two Way Attribute Key.
        # @param [RelationMutate] on_delete Constraints option
        #
        # @return [AttributeRelationship]
        def create_relationship_attribute(database_id:, collection_id:, related_collection_id:, type:, two_way: nil, key: nil, two_way_key: nil, on_delete: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/relationship'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if related_collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "relatedCollectionId"')
            end

            if type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "type"')
            end

            api_params = {
                relatedCollectionId: related_collection_id,
                type: type,
                twoWay: two_way,
                key: key,
                twoWayKey: two_way_key,
                onDelete: on_delete,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeRelationship
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createStringColumn` instead.
        #
        # Create a string attribute.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Attribute Key.
        # @param [Integer] size Attribute size for text attributes, in number of characters.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        # @param [] encrypt Toggle encryption for the attribute. Encryption enhances security by not storing any plain text values in the database. However, encrypted attributes cannot be queried.
        #
        # @return [AttributeString]
        def create_string_attribute(database_id:, collection_id:, key:, size:, required:, default: nil, array: nil, encrypt: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/string'
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

            if size.nil?
              raise Appwrite::Exception.new('Missing required parameter: "size"')
            end

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                size: size,
                required: required,
                default: default,
                array: array,
                encrypt: encrypt,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeString
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateStringColumn` instead.
        #
        # Update a string attribute. Changing the `default` value will not update
        # already existing documents.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [Integer] size Maximum size of the string attribute.
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeString]
        def update_string_attribute(database_id:, collection_id:, key:, required:, default:, size: nil, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/string/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                default: default,
                size: size,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeString
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createUrlColumn` instead.
        #
        # Create a URL attribute.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [] array Is attribute an array?
        #
        # @return [AttributeUrl]
        def create_url_attribute(database_id:, collection_id:, key:, required:, default: nil, array: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/url'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            api_params = {
                key: key,
                required: required,
                default: default,
                array: array,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeUrl
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateUrlColumn` instead.
        #
        # Update an url attribute. Changing the `default` value will not update
        # already existing documents.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [] required Is attribute required?
        # @param [String] default Default value for attribute when not provided. Cannot be set when attribute is required.
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeUrl]
        def update_url_attribute(database_id:, collection_id:, key:, required:, default:, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/url/{key}'
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

            if required.nil?
              raise Appwrite::Exception.new('Missing required parameter: "required"')
            end

            if default.nil?
              raise Appwrite::Exception.new('Missing required parameter: "default"')
            end

            api_params = {
                required: required,
                default: default,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeUrl
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.getColumn` instead.
        #
        # Get attribute by ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        #
        # @return []
        def get_attribute(database_id:, collection_id:, key:)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/{key}'
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
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.deleteColumn` instead.
        #
        # Deletes an attribute.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        #
        # @return []
        def delete_attribute(database_id:, collection_id:, key:)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/{key}'
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

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateRelationshipColumn` instead.
        #
        # Update relationship attribute. [Learn more about relationship
        # attributes](https://appwrite.io/docs/databases-relationships#relationship-attributes).
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] key Attribute Key.
        # @param [RelationMutate] on_delete Constraints option
        # @param [String] new_key New Attribute Key.
        #
        # @return [AttributeRelationship]
        def update_relationship_attribute(database_id:, collection_id:, key:, on_delete: nil, new_key: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/attributes/{key}/relationship'
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
                onDelete: on_delete,
                newKey: new_key,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AttributeRelationship
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.listRows` instead.
        #
        # Get a list of all the user's documents in a given collection. You can use
        # the query params to filter your results.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [DocumentList]
        def list_documents(database_id:, collection_id:, queries: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createRow` instead.
        #
        # Create a new Document. Before using this route, you should create a new
        # collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.
        # @param [String] document_id Document ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [Hash] data Document data as JSON object.
        # @param [Array] permissions An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Document]
        def create_document(database_id:, collection_id:, document_id:, data:, permissions: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createRows` instead.
        #
        # Create new Documents. Before using this route, you should create a new
        # collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.
        # @param [Array] documents Array of documents data as JSON objects.
        #
        # @return [DocumentList]
        def create_documents(database_id:, collection_id:, documents:)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRows` instead.
        #
        # Create or update Documents. Before using this route, you should create a
        # new collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
        # API or directly from your database console.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [Array] documents Array of document data as JSON objects. May contain partial documents.
        #
        # @return [DocumentList]
        def upsert_documents(database_id:, collection_id:, documents:)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents'
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
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DocumentList
            )
        end

        #
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateRows` instead.
        #
        # Update all documents that match your queries, if no queries are submitted
        # then all documents are updated. You can pass only specific fields to be
        # updated.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [Hash] data Document data as JSON object. Include only attribute and value pairs to be updated.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [DocumentList]
        def update_documents(database_id:, collection_id:, data: nil, queries: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.deleteRows` instead.
        #
        # Bulk delete documents using queries, if no queries are passed then all
        # documents are deleted.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [DocumentList]
        def delete_documents(database_id:, collection_id:, queries: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.getRow` instead.
        #
        # Get a document by its unique ID. This endpoint response returns a JSON
        # object with the document data.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] document_id Document ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [Document]
        def get_document(database_id:, collection_id:, document_id:, queries: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRow` instead.
        #
        # Create or update a Document. Before using this route, you should create a
        # new collection resource using either a [server
        # integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [Hash] data Document data as JSON object. Include all required attributes of the document to be created or updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Document]
        def upsert_document(database_id:, collection_id:, document_id:, data:, permissions: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
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

            if data.nil?
              raise Appwrite::Exception.new('Missing required parameter: "data"')
            end

            api_params = {
                data: data,
                permissions: permissions,
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.updateRow` instead.
        #
        # Update a document by its unique ID. Using the patch method you can pass
        # only specific fields that will get updated.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [Hash] data Document data as JSON object. Include only attribute and value pairs to be updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Document]
        def update_document(database_id:, collection_id:, document_id:, data: nil, permissions: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.deleteRow` instead.
        #
        # Delete a document by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] document_id Document ID.
        #
        # @return []
        def delete_document(database_id:, collection_id:, document_id:)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.decrementRowColumn` instead.
        #
        # Decrement a specific attribute of a document by a given value.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [String] attribute Attribute key.
        # @param [Float] value Value to increment the attribute by. The value must be a number.
        # @param [Float] min Minimum value for the attribute. If the current value is lesser than this value, an exception will be thrown.
        #
        # @return [Document]
        def decrement_document_attribute(database_id:, collection_id:, document_id:, attribute:, value: nil, min: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/decrement'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)
                .gsub('{attribute}', attribute)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            if attribute.nil?
              raise Appwrite::Exception.new('Missing required parameter: "attribute"')
            end

            api_params = {
                value: value,
                min: min,
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.incrementRowColumn` instead.
        #
        # Increment a specific attribute of a document by a given value.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID.
        # @param [String] document_id Document ID.
        # @param [String] attribute Attribute key.
        # @param [Float] value Value to increment the attribute by. The value must be a number.
        # @param [Float] max Maximum value for the attribute. If the current value is greater than this value, an error will be thrown.
        #
        # @return [Document]
        def increment_document_attribute(database_id:, collection_id:, document_id:, attribute:, value: nil, max: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/increment'
                .gsub('{databaseId}', database_id)
                .gsub('{collectionId}', collection_id)
                .gsub('{documentId}', document_id)
                .gsub('{attribute}', attribute)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if collection_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "collectionId"')
            end

            if document_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "documentId"')
            end

            if attribute.nil?
              raise Appwrite::Exception.new('Missing required parameter: "attribute"')
            end

            api_params = {
                value: value,
                max: max,
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.listIndexes` instead.
        #
        # List indexes in the collection.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, type, status, attributes, error
        #
        # @return [IndexList]
        def list_indexes(database_id:, collection_id:, queries: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/indexes'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.createIndex` instead.
        #
        # Creates an index on the attributes listed. Your index should include all
        # the attributes you will query in a single request.
        # Attributes can be `key`, `fulltext`, and `unique`.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        # @param [IndexType] type Index type.
        # @param [Array] attributes Array of attributes to index. Maximum of 100 attributes are allowed, each 32 characters long.
        # @param [Array] orders Array of index orders. Maximum of 100 orders are allowed.
        # @param [Array] lengths Length of index. Maximum of 100
        #
        # @return [Index]
        def create_index(database_id:, collection_id:, key:, type:, attributes:, orders: nil, lengths: nil)
            api_path = '/databases/{databaseId}/collections/{collectionId}/indexes'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.getIndex` instead.
        #
        # Get index by ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        #
        # @return [Index]
        def get_index(database_id:, collection_id:, key:)
            api_path = '/databases/{databaseId}/collections/{collectionId}/indexes/{key}'
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
        # @deprecated This API has been deprecated since 1.8.0. Please use `TablesDB.deleteIndex` instead.
        #
        # Delete an index.
        #
        # @param [String] database_id Database ID.
        # @param [String] collection_id Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).
        # @param [String] key Index Key.
        #
        # @return []
        def delete_index(database_id:, collection_id:, key:)
            api_path = '/databases/{databaseId}/collections/{collectionId}/indexes/{key}'
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