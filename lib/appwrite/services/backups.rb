#frozen_string_literal: true

module Appwrite
    class Backups < Service

        def initialize(client)
            @client = client
        end

        # List all archives for a project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [BackupArchiveList]
        def list_archives(queries: nil)
            api_path = '/backups/archives'

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
                response_type: Models::BackupArchiveList
            )
        end

        # Create a new archive asynchronously for a project.
        #
        # @param [Array] services Array of services to backup
        # @param [String] resource_id Resource ID. When set, only this single resource will be backed up.
        #
        # @return [BackupArchive]
        def create_archive(services:, resource_id: nil)
            api_path = '/backups/archives'

            if services.nil?
              raise Appwrite::Exception.new('Missing required parameter: "services"')
            end

            api_params = {
                services: services,
                resourceId: resource_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::BackupArchive
            )
        end

        # Get a backup archive using it's ID.
        #
        # @param [String] archive_id Archive ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        #
        # @return [BackupArchive]
        def get_archive(archive_id:)
            api_path = '/backups/archives/{archiveId}'
                .gsub('{archiveId}', archive_id)

            if archive_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "archiveId"')
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
                response_type: Models::BackupArchive
            )
        end

        # Delete an existing archive for a project.
        #
        # @param [String] archive_id Policy ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        #
        # @return []
        def delete_archive(archive_id:)
            api_path = '/backups/archives/{archiveId}'
                .gsub('{archiveId}', archive_id)

            if archive_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "archiveId"')
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

        # List all policies for a project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [BackupPolicyList]
        def list_policies(queries: nil)
            api_path = '/backups/policies'

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
                response_type: Models::BackupPolicyList
            )
        end

        # Create a new backup policy.
        #
        # @param [String] policy_id Policy ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [Array] services Array of services to backup
        # @param [Integer] retention Days to keep backups before deletion
        # @param [String] schedule Schedule CRON syntax.
        # @param [String] name Policy name. Max length: 128 chars.
        # @param [String] resource_id Resource ID. When set, only this single resource will be backed up.
        # @param [] enabled Is policy enabled? When set to 'disabled', no backups will be taken
        #
        # @return [BackupPolicy]
        def create_policy(policy_id:, services:, retention:, schedule:, name: nil, resource_id: nil, enabled: nil)
            api_path = '/backups/policies'

            if policy_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "policyId"')
            end

            if services.nil?
              raise Appwrite::Exception.new('Missing required parameter: "services"')
            end

            if retention.nil?
              raise Appwrite::Exception.new('Missing required parameter: "retention"')
            end

            if schedule.nil?
              raise Appwrite::Exception.new('Missing required parameter: "schedule"')
            end

            api_params = {
                policyId: policy_id,
                name: name,
                services: services,
                resourceId: resource_id,
                enabled: enabled,
                retention: retention,
                schedule: schedule,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::BackupPolicy
            )
        end

        # Get a backup policy using it's ID.
        #
        # @param [String] policy_id Policy ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        #
        # @return [BackupPolicy]
        def get_policy(policy_id:)
            api_path = '/backups/policies/{policyId}'
                .gsub('{policyId}', policy_id)

            if policy_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "policyId"')
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
                response_type: Models::BackupPolicy
            )
        end

        # Update an existing policy using it's ID.
        #
        # @param [String] policy_id Policy ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Policy name. Max length: 128 chars.
        # @param [Integer] retention Days to keep backups before deletion
        # @param [String] schedule Cron expression
        # @param [] enabled Is Backup enabled? When set to 'disabled', No backup will be taken
        #
        # @return [BackupPolicy]
        def update_policy(policy_id:, name: nil, retention: nil, schedule: nil, enabled: nil)
            api_path = '/backups/policies/{policyId}'
                .gsub('{policyId}', policy_id)

            if policy_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "policyId"')
            end

            api_params = {
                name: name,
                retention: retention,
                schedule: schedule,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::BackupPolicy
            )
        end

        # Delete a policy using it's ID.
        #
        # @param [String] policy_id Policy ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        #
        # @return []
        def delete_policy(policy_id:)
            api_path = '/backups/policies/{policyId}'
                .gsub('{policyId}', policy_id)

            if policy_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "policyId"')
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

        # Create and trigger a new restoration for a backup on a project.
        #
        # @param [String] archive_id Backup archive ID to restore
        # @param [Array] services Array of services to restore
        # @param [String] new_resource_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] new_resource_name Database name. Max length: 128 chars.
        #
        # @return [BackupRestoration]
        def create_restoration(archive_id:, services:, new_resource_id: nil, new_resource_name: nil)
            api_path = '/backups/restoration'

            if archive_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "archiveId"')
            end

            if services.nil?
              raise Appwrite::Exception.new('Missing required parameter: "services"')
            end

            api_params = {
                archiveId: archive_id,
                services: services,
                newResourceId: new_resource_id,
                newResourceName: new_resource_name,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::BackupRestoration
            )
        end

        # List all backup restorations for a project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [BackupRestorationList]
        def list_restorations(queries: nil)
            api_path = '/backups/restorations'

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
                response_type: Models::BackupRestorationList
            )
        end

        # Get the current status of a backup restoration.
        #
        # @param [String] restoration_id Restoration ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        #
        # @return [BackupRestoration]
        def get_restoration(restoration_id:)
            api_path = '/backups/restorations/{restorationId}'
                .gsub('{restorationId}', restoration_id)

            if restoration_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "restorationId"')
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
                response_type: Models::BackupRestoration
            )
        end

    end 
end