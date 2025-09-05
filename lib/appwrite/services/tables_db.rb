#frozen_string_literal: true

module Appwrite
    class TablesDB < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all databases from the current Appwrite project. You can use
        # the search parameter to filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: name
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [DatabaseList]
        def list(queries: nil, search: nil)
            api_path = '/tablesdb'

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

        # Create a new Database.
        # 
        #
        # @param [String] database_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is the database enabled? When set to 'disabled', users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        #
        # @return [Database]
        def create(database_id:, name:, enabled: nil)
            api_path = '/tablesdb'

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

        # Get a database by its unique ID. This endpoint response returns a JSON
        # object with the database metadata.
        #
        # @param [String] database_id Database ID.
        #
        # @return [Database]
        def get(database_id:)
            api_path = '/tablesdb/{databaseId}'
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

        # Update a database by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] name Database name. Max length: 128 chars.
        # @param [] enabled Is database enabled? When set to 'disabled', users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.
        #
        # @return [Database]
        def update(database_id:, name:, enabled: nil)
            api_path = '/tablesdb/{databaseId}'
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

        # Delete a database by its unique ID. Only API keys with with databases.write
        # scope can delete a database.
        #
        # @param [String] database_id Database ID.
        #
        # @return []
        def delete(database_id:)
            api_path = '/tablesdb/{databaseId}'
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

        # Get a list of all tables that belong to the provided databaseId. You can
        # use the search parameter to filter your results.
        #
        # @param [String] database_id Database ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: name, enabled, rowSecurity
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [TableList]
        def list_tables(database_id:, queries: nil, search: nil)
            api_path = '/tablesdb/{databaseId}/tables'
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
                response_type: Models::TableList
            )
        end

        # Create a new Table. Before using this route, you should create a new
        # database resource using either a [server
        # integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Table name. Max length: 128 chars.
        # @param [Array] permissions An array of permissions strings. By default, no user is granted with any permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] row_security Enables configuring permissions for individual rows. A user needs one of row or table level permissions to access a row. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is table enabled? When set to 'disabled', users cannot access the table but Server SDKs with and API key can still read and write to the table. No data is lost when this is toggled.
        #
        # @return [Table]
        def create_table(database_id:, table_id:, name:, permissions: nil, row_security: nil, enabled: nil)
            api_path = '/tablesdb/{databaseId}/tables'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                tableId: table_id,
                name: name,
                permissions: permissions,
                rowSecurity: row_security,
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
                response_type: Models::Table
            )
        end

        # Get a table by its unique ID. This endpoint response returns a JSON object
        # with the table metadata.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        #
        # @return [Table]
        def get_table(database_id:, table_id:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::Table
            )
        end

        # Update a table by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] name Table name. Max length: 128 chars.
        # @param [Array] permissions An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] row_security Enables configuring permissions for individual rows. A user needs one of row or table level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] enabled Is table enabled? When set to 'disabled', users cannot access the table but Server SDKs with and API key can still read and write to the table. No data is lost when this is toggled.
        #
        # @return [Table]
        def update_table(database_id:, table_id:, name:, permissions: nil, row_security: nil, enabled: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                name: name,
                permissions: permissions,
                rowSecurity: row_security,
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
                response_type: Models::Table
            )
        end

        # Delete a table by its unique ID. Only users with write permissions have
        # access to delete this resource.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        #
        # @return []
        def delete_table(database_id:, table_id:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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

        # List columns in the table.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: key, type, size, required, array, status, error
        #
        # @return [ColumnList]
        def list_columns(database_id:, table_id:, queries: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnList
            )
        end

        # Create a boolean column.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [] default Default value for column when not provided. Cannot be set when column is required.
        # @param [] array Is column an array?
        #
        # @return [ColumnBoolean]
        def create_boolean_column(database_id:, table_id:, key:, required:, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/boolean'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnBoolean
            )
        end

        # Update a boolean column. Changing the `default` value will not update
        # already existing rows.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [] default Default value for column when not provided. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnBoolean]
        def update_boolean_column(database_id:, table_id:, key:, required:, default:, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/boolean/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnBoolean
            )
        end

        # Create a date time column according to the ISO 8601 standard.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for the column in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Cannot be set when column is required.
        # @param [] array Is column an array?
        #
        # @return [ColumnDatetime]
        def create_datetime_column(database_id:, table_id:, key:, required:, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/datetime'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnDatetime
            )
        end

        # Update a date time column. Changing the `default` value will not update
        # already existing rows.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnDatetime]
        def update_datetime_column(database_id:, table_id:, key:, required:, default:, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/datetime/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnDatetime
            )
        end

        # Create an email column.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [] array Is column an array?
        #
        # @return [ColumnEmail]
        def create_email_column(database_id:, table_id:, key:, required:, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/email'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnEmail
            )
        end

        # Update an email column. Changing the `default` value will not update
        # already existing rows.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnEmail]
        def update_email_column(database_id:, table_id:, key:, required:, default:, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/email/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnEmail
            )
        end

        # Create an enumeration column. The `elements` param acts as a white-list of
        # accepted values for this column.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [Array] elements Array of enum values.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [] array Is column an array?
        #
        # @return [ColumnEnum]
        def create_enum_column(database_id:, table_id:, key:, elements:, required:, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/enum'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnEnum
            )
        end

        # Update an enum column. Changing the `default` value will not update already
        # existing rows.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [Array] elements Updated list of enum values.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnEnum]
        def update_enum_column(database_id:, table_id:, key:, elements:, required:, default:, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/enum/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnEnum
            )
        end

        # Create a float column. Optionally, minimum and maximum values can be
        # provided.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [Float] min Minimum value
        # @param [Float] max Maximum value
        # @param [Float] default Default value. Cannot be set when required.
        # @param [] array Is column an array?
        #
        # @return [ColumnFloat]
        def create_float_column(database_id:, table_id:, key:, required:, min: nil, max: nil, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/float'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnFloat
            )
        end

        # Update a float column. Changing the `default` value will not update already
        # existing rows.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [Float] default Default value. Cannot be set when required.
        # @param [Float] min Minimum value
        # @param [Float] max Maximum value
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnFloat]
        def update_float_column(database_id:, table_id:, key:, required:, default:, min: nil, max: nil, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/float/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnFloat
            )
        end

        # Create an integer column. Optionally, minimum and maximum values can be
        # provided.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [Integer] min Minimum value
        # @param [Integer] max Maximum value
        # @param [Integer] default Default value. Cannot be set when column is required.
        # @param [] array Is column an array?
        #
        # @return [ColumnInteger]
        def create_integer_column(database_id:, table_id:, key:, required:, min: nil, max: nil, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/integer'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnInteger
            )
        end

        # Update an integer column. Changing the `default` value will not update
        # already existing rows.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [Integer] default Default value. Cannot be set when column is required.
        # @param [Integer] min Minimum value
        # @param [Integer] max Maximum value
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnInteger]
        def update_integer_column(database_id:, table_id:, key:, required:, default:, min: nil, max: nil, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/integer/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnInteger
            )
        end

        # Create IP address column.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value. Cannot be set when column is required.
        # @param [] array Is column an array?
        #
        # @return [ColumnIp]
        def create_ip_column(database_id:, table_id:, key:, required:, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/ip'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnIp
            )
        end

        # Update an ip column. Changing the `default` value will not update already
        # existing rows.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnIp]
        def update_ip_column(database_id:, table_id:, key:, required:, default:, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/ip/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnIp
            )
        end

        # Create a geometric line column.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided, as JSON string. Cannot be set when column is required.
        #
        # @return [ColumnLine]
        def create_line_column(database_id:, table_id:, key:, required:, default: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/line'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnLine
            )
        end

        # Update a line column. Changing the `default` value will not update already
        # existing rows.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided, as JSON string. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnLine]
        def update_line_column(database_id:, table_id:, key:, required:, default: nil, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/line/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnLine
            )
        end

        # Create a geometric point column.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided, as JSON string. Cannot be set when column is required.
        #
        # @return [ColumnPoint]
        def create_point_column(database_id:, table_id:, key:, required:, default: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/point'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnPoint
            )
        end

        # Update a point column. Changing the `default` value will not update already
        # existing rows.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided, as JSON string. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnPoint]
        def update_point_column(database_id:, table_id:, key:, required:, default: nil, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/point/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnPoint
            )
        end

        # Create a geometric polygon column.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided, as JSON string. Cannot be set when column is required.
        #
        # @return [ColumnPolygon]
        def create_polygon_column(database_id:, table_id:, key:, required:, default: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/polygon'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnPolygon
            )
        end

        # Update a polygon column. Changing the `default` value will not update
        # already existing rows.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided, as JSON string. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnPolygon]
        def update_polygon_column(database_id:, table_id:, key:, required:, default: nil, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/polygon/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnPolygon
            )
        end

        # Create relationship column. [Learn more about relationship
        # columns](https://appwrite.io/docs/databases-relationships#relationship-columns).
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] related_table_id Related Table ID.
        # @param [RelationshipType] type Relation type
        # @param [] two_way Is Two Way?
        # @param [String] key Column Key.
        # @param [String] two_way_key Two Way Column Key.
        # @param [RelationMutate] on_delete Constraints option
        #
        # @return [ColumnRelationship]
        def create_relationship_column(database_id:, table_id:, related_table_id:, type:, two_way: nil, key: nil, two_way_key: nil, on_delete: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/relationship'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if related_table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "relatedTableId"')
            end

            if type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "type"')
            end

            api_params = {
                relatedTableId: related_table_id,
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
                response_type: Models::ColumnRelationship
            )
        end

        # Create a string column.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [Integer] size Column size for text columns, in number of characters.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [] array Is column an array?
        # @param [] encrypt Toggle encryption for the column. Encryption enhances security by not storing any plain text values in the database. However, encrypted columns cannot be queried.
        #
        # @return [ColumnString]
        def create_string_column(database_id:, table_id:, key:, size:, required:, default: nil, array: nil, encrypt: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/string'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnString
            )
        end

        # Update a string column. Changing the `default` value will not update
        # already existing rows.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [Integer] size Maximum size of the string column.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnString]
        def update_string_column(database_id:, table_id:, key:, required:, default:, size: nil, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/string/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnString
            )
        end

        # Create a URL column.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [] array Is column an array?
        #
        # @return [ColumnUrl]
        def create_url_column(database_id:, table_id:, key:, required:, default: nil, array: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/url'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnUrl
            )
        end

        # Update an url column. Changing the `default` value will not update already
        # existing rows.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [] required Is column required?
        # @param [String] default Default value for column when not provided. Cannot be set when column is required.
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnUrl]
        def update_url_column(database_id:, table_id:, key:, required:, default:, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/url/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnUrl
            )
        end

        # Get column by ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        #
        # @return []
        def get_column(database_id:, table_id:, key:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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

        # Deletes a column.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        #
        # @return []
        def delete_column(database_id:, table_id:, key:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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

        # Update relationship column. [Learn more about relationship
        # columns](https://appwrite.io/docs/databases-relationships#relationship-columns).
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] key Column Key.
        # @param [RelationMutate] on_delete Constraints option
        # @param [String] new_key New Column Key.
        #
        # @return [ColumnRelationship]
        def update_relationship_column(database_id:, table_id:, key:, on_delete: nil, new_key: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/columns/{key}/relationship'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnRelationship
            )
        end

        # List indexes on the table.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: key, type, status, attributes, error
        #
        # @return [ColumnIndexList]
        def list_indexes(database_id:, table_id:, queries: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/indexes'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnIndexList
            )
        end

        # Creates an index on the columns listed. Your index should include all the
        # columns you will query in a single request.
        # Type can be `key`, `fulltext`, or `unique`.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Index Key.
        # @param [IndexType] type Index type.
        # @param [Array] columns Array of columns to index. Maximum of 100 columns are allowed, each 32 characters long.
        # @param [Array] orders Array of index orders. Maximum of 100 orders are allowed.
        # @param [Array] lengths Length of index. Maximum of 100
        #
        # @return [ColumnIndex]
        def create_index(database_id:, table_id:, key:, type:, columns:, orders: nil, lengths: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/indexes'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "type"')
            end

            if columns.nil?
              raise Appwrite::Exception.new('Missing required parameter: "columns"')
            end

            api_params = {
                key: key,
                type: type,
                columns: columns,
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
                response_type: Models::ColumnIndex
            )
        end

        # Get index by ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Index Key.
        #
        # @return [ColumnIndex]
        def get_index(database_id:, table_id:, key:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/indexes/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::ColumnIndex
            )
        end

        # Delete an index.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] key Index Key.
        #
        # @return []
        def delete_index(database_id:, table_id:, key:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/indexes/{key}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{key}', key)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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

        # Get a list of all the user's rows in a given table. You can use the query
        # params to filter your results.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the TableDB service [server integration](https://appwrite.io/docs/server/tablesdbdb#tablesdbCreate).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [RowList]
        def list_rows(database_id:, table_id:, queries: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::RowList
            )
        end

        # Create a new Row. Before using this route, you should create a new table
        # resource using either a [server
        # integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate). Make sure to define columns before creating rows.
        # @param [String] row_id Row ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [Hash] data Row data as JSON object.
        # @param [Array] permissions An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Row]
        def create_row(database_id:, table_id:, row_id:, data:, permissions: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if row_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rowId"')
            end

            if data.nil?
              raise Appwrite::Exception.new('Missing required parameter: "data"')
            end

            api_params = {
                rowId: row_id,
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
                response_type: Models::Row
            )
        end

        # Create new Rows. Before using this route, you should create a new table
        # resource using either a [server
        # integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate). Make sure to define columns before creating rows.
        # @param [Array] rows Array of documents data as JSON objects.
        #
        # @return [RowList]
        def create_rows(database_id:, table_id:, rows:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if rows.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rows"')
            end

            api_params = {
                rows: rows,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::RowList
            )
        end

        # Create or update Rows. Before using this route, you should create a new
        # table resource using either a [server
        # integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
        # API or directly from your database console.
        # 
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [Array] rows Array of row data as JSON objects. May contain partial rows.
        #
        # @return [RowList]
        def upsert_rows(database_id:, table_id:, rows:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if rows.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rows"')
            end

            api_params = {
                rows: rows,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::RowList
            )
        end

        # Update all rows that match your queries, if no queries are submitted then
        # all rows are updated. You can pass only specific fields to be updated.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [Hash] data Row data as JSON object. Include only column and value pairs to be updated.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [RowList]
        def update_rows(database_id:, table_id:, data: nil, queries: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::RowList
            )
        end

        # Bulk delete rows using queries, if no queries are passed then all rows are
        # deleted.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [RowList]
        def delete_rows(database_id:, table_id:, queries: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
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
                response_type: Models::RowList
            )
        end

        # Get a row by its unique ID. This endpoint response returns a JSON object
        # with the row data.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] row_id Row ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [Row]
        def get_row(database_id:, table_id:, row_id:, queries: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{rowId}', row_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if row_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rowId"')
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
                response_type: Models::Row
            )
        end

        # Create or update a Row. Before using this route, you should create a new
        # table resource using either a [server
        # integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
        # API or directly from your database console.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] row_id Row ID.
        # @param [Hash] data Row data as JSON object. Include all required columns of the row to be created or updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Row]
        def upsert_row(database_id:, table_id:, row_id:, data: nil, permissions: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{rowId}', row_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if row_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rowId"')
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
                response_type: Models::Row
            )
        end

        # Update a row by its unique ID. Using the patch method you can pass only
        # specific fields that will get updated.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] row_id Row ID.
        # @param [Hash] data Row data as JSON object. Include only columns and value pairs to be updated.
        # @param [Array] permissions An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Row]
        def update_row(database_id:, table_id:, row_id:, data: nil, permissions: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{rowId}', row_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if row_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rowId"')
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
                response_type: Models::Row
            )
        end

        # Delete a row by its unique ID.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreate).
        # @param [String] row_id Row ID.
        #
        # @return []
        def delete_row(database_id:, table_id:, row_id:)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{rowId}', row_id)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if row_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rowId"')
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

        # Decrement a specific column of a row by a given value.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] row_id Row ID.
        # @param [String] column Column key.
        # @param [Float] value Value to increment the column by. The value must be a number.
        # @param [Float] min Minimum value for the column. If the current value is lesser than this value, an exception will be thrown.
        #
        # @return [Row]
        def decrement_row_column(database_id:, table_id:, row_id:, column:, value: nil, min: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/decrement'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{rowId}', row_id)
                .gsub('{column}', column)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if row_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rowId"')
            end

            if column.nil?
              raise Appwrite::Exception.new('Missing required parameter: "column"')
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
                response_type: Models::Row
            )
        end

        # Increment a specific column of a row by a given value.
        #
        # @param [String] database_id Database ID.
        # @param [String] table_id Table ID.
        # @param [String] row_id Row ID.
        # @param [String] column Column key.
        # @param [Float] value Value to increment the column by. The value must be a number.
        # @param [Float] max Maximum value for the column. If the current value is greater than this value, an error will be thrown.
        #
        # @return [Row]
        def increment_row_column(database_id:, table_id:, row_id:, column:, value: nil, max: nil)
            api_path = '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/increment'
                .gsub('{databaseId}', database_id)
                .gsub('{tableId}', table_id)
                .gsub('{rowId}', row_id)
                .gsub('{column}', column)

            if database_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if table_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tableId"')
            end

            if row_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rowId"')
            end

            if column.nil?
              raise Appwrite::Exception.new('Missing required parameter: "column"')
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
                response_type: Models::Row
            )
        end

    end 
end