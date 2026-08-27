# frozen_string_literal: true

module Appwrite
    class Mongo < Service
        def initialize(client)
            @client = client
        end

        # List all dedicated databases. Results support pagination.
        #
        # @param [Array] queries Array of query strings.
        #
        # @return [DedicatedDatabaseList]
        def list(
            queries: nil
        )
            api_path = '/mongo'

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
                response_type: Models::DedicatedDatabaseList
            )
        end

        # Create a new dedicated database with the chosen engine and configuration.
        # Status will be &#039;provisioning&#039; until the database is ready.
        #
        # @param [String] database_id Database ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Database display name. Max length: 128 chars.
        # @param [String] version Database engine version. Defaults to latest for selected engine.
        # @param [String] specification Specification identifier. Drives the allocated CPU, memory, storage, storage class, and connection ceiling.
        # @param [Integer] replicas Number of high availability replicas (0-5). High availability is enabled when greater than 0.
        # @param [String] sync_mode Replication sync mode preference. Allowed values: async, sync, quorum.
        # @param [Integer] network_idle_timeout_seconds Connection idle timeout in seconds.
        # @param [Array] network_ip_allowlist IP addresses/CIDR ranges allowed to connect.
        # @param [Integer] idle_timeout_minutes Minutes of inactivity before container scales to zero.
        # @param [] pitr Enable point-in-time recovery (PITR). Continuously archives changes so the database can be restored to any moment within the retention window.
        # @param [Integer] pitr_retention_days Number of days to retain PITR data.
        # @param [] storage_autoscaling Enable automatic storage expansion when usage exceeds threshold.
        # @param [Integer] storage_autoscaling_threshold_percent Storage usage percentage (50-95) that triggers automatic expansion.
        # @param [Integer] storage_autoscaling_max_gb Maximum storage size in GB for autoscaling. 0 means no limit.
        #
        # @return [DedicatedDatabase]
        def create(
            database_id:,
            name:,
            version: nil,
            specification: nil,
            replicas: nil,
            sync_mode: nil,
            network_idle_timeout_seconds: nil,
            network_ip_allowlist: nil,
            idle_timeout_minutes: nil,
            pitr: nil,
            pitr_retention_days: nil,
            storage_autoscaling: nil,
            storage_autoscaling_threshold_percent: nil,
            storage_autoscaling_max_gb: nil
        )
            api_path = '/mongo'

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                databaseId: database_id,
                name: name,
                version: version,
                specification: specification,
                replicas: replicas,
                syncMode: sync_mode,
                networkIdleTimeoutSeconds: network_idle_timeout_seconds,
                networkIPAllowlist: network_ip_allowlist,
                idleTimeoutMinutes: idle_timeout_minutes,
                pitr: pitr,
                pitrRetentionDays: pitr_retention_days,
                storageAutoscaling: storage_autoscaling,
                storageAutoscalingThresholdPercent: storage_autoscaling_threshold_percent,
                storageAutoscalingMaxGb: storage_autoscaling_max_gb,
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

        # List the dedicated database specifications available on the current plan.
        # Each specification reports its resource limits, pricing, and whether it is
        # enabled for the organization.
        #
        #
        # @return [DedicatedDatabaseSpecificationList]
        def list_specifications()
            api_path = '/mongo/specifications'

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

        # Get a dedicated database by its unique ID. Returns the database
        # configuration and current status.
        #
        # @param [String] database_id Database ID.
        #
        # @return [DedicatedDatabase]
        def get(
            database_id:
        )
            api_path = '/mongo/{databaseId}'
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
                response_type: Models::DedicatedDatabase
            )
        end

        # Update a dedicated database configuration. All changes are applied with
        # zero downtime. Specification changes (cpu, memory, storage) are handled via
        # rolling cutover. Storage expansion is done online. All other settings are
        # applied in-place.
        #
        # @param [String] database_id Database ID.
        # @param [String] name Database display name.
        # @param [String] status Database status. Allowed values: ready, paused, inactive. Set to &quot;paused&quot; to pause, &quot;ready&quot; to resume (also recovers a failed database whose infrastructure is healthy), or &quot;inactive&quot; to spin down a shared-pool database.
        # @param [String] specification Specification. Changes cpu, memory, storage, connection ceiling, and node pool based on specification config. Resource changes are applied via rolling cutover with zero downtime.
        # @param [Integer] replicas Number of high availability replicas (0-5). High availability is enabled when greater than 0.
        # @param [String] sync_mode Replication sync mode preference. Allowed values: async, sync, quorum.
        # @param [Integer] network_idle_timeout_seconds Connection idle timeout in seconds (60-86400).
        # @param [Array] network_ip_allowlist IP addresses/CIDR ranges allowed to connect.
        # @param [Integer] idle_timeout_minutes Minutes before container scales to zero.
        # @param [] pitr Enable or disable point-in-time recovery (PITR).
        # @param [Integer] pitr_retention_days Days to retain PITR data.
        # @param [] storage_autoscaling Enable automatic storage expansion when usage exceeds threshold.
        # @param [Integer] storage_autoscaling_threshold_percent Storage usage percentage (50-95) that triggers automatic expansion.
        # @param [Integer] storage_autoscaling_max_gb Maximum storage size in GB for autoscaling. 0 means no limit.
        # @param [Float] metrics_trace_sample_rate Fraction of queries to trace (0.0–1.0). Forwarded to the sidecar.
        # @param [Integer] metrics_slow_query_log_threshold_ms Threshold in ms above which queries are logged as slow. Forwarded to the sidecar.
        # @param [] sql_api_enabled Enable the SQL API sidecar for this database.
        # @param [Array] sql_api_allowed_statements Statement types the SQL API accepts. Allowed values: SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, TRUNCATE, GRANT, REVOKE.
        # @param [Integer] sql_api_max_rows Maximum rows returned per SQL API execution (1-1000000).
        # @param [Integer] sql_api_max_bytes Maximum serialised SQL API result payload in bytes (1024-104857600).
        # @param [Integer] sql_api_timeout_seconds Per-call SQL API execution timeout in seconds (1-300).
        #
        # @return [DedicatedDatabase]
        def update(
            database_id:,
            name: nil,
            status: nil,
            specification: nil,
            replicas: nil,
            sync_mode: nil,
            network_idle_timeout_seconds: nil,
            network_ip_allowlist: nil,
            idle_timeout_minutes: nil,
            pitr: nil,
            pitr_retention_days: nil,
            storage_autoscaling: nil,
            storage_autoscaling_threshold_percent: nil,
            storage_autoscaling_max_gb: nil,
            metrics_trace_sample_rate: nil,
            metrics_slow_query_log_threshold_ms: nil,
            sql_api_enabled: nil,
            sql_api_allowed_statements: nil,
            sql_api_max_rows: nil,
            sql_api_max_bytes: nil,
            sql_api_timeout_seconds: nil
        )
            api_path = '/mongo/{databaseId}'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                name: name,
                status: status,
                specification: specification,
                replicas: replicas,
                syncMode: sync_mode,
                networkIdleTimeoutSeconds: network_idle_timeout_seconds,
                networkIPAllowlist: network_ip_allowlist,
                idleTimeoutMinutes: idle_timeout_minutes,
                pitr: pitr,
                pitrRetentionDays: pitr_retention_days,
                storageAutoscaling: storage_autoscaling,
                storageAutoscalingThresholdPercent: storage_autoscaling_threshold_percent,
                storageAutoscalingMaxGb: storage_autoscaling_max_gb,
                metricsTraceSampleRate: metrics_trace_sample_rate,
                metricsSlowQueryLogThresholdMs: metrics_slow_query_log_threshold_ms,
                sqlApiEnabled: sql_api_enabled,
                sqlApiAllowedStatements: sql_api_allowed_statements,
                sqlApiMaxRows: sql_api_max_rows,
                sqlApiMaxBytes: sql_api_max_bytes,
                sqlApiTimeoutSeconds: sql_api_timeout_seconds,
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
                response_type: Models::DedicatedDatabase
            )
        end

        # Delete a dedicated database. This action is irreversible. The database
        # status will be set to &#039;deleting&#039; and all resources will be cleaned up.
        # Deletion is allowed from any state, and repeating the call re-dispatches
        # the cleanup.
        #
        # @param [String] database_id Database ID.
        #
        # @return []
        def delete(
            database_id:
        )
            api_path = '/mongo/{databaseId}'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

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

        # List all backups for a dedicated database. Results can be filtered by
        # status and type.
        #
        # @param [String] database_id Database ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: status, type, databaseId
        #
        # @return [DedicatedDatabaseBackupList]
        def list_backups(
            database_id:,
            queries: nil
        )
            api_path = '/mongo/{databaseId}/backups'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

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
                response_type: Models::DedicatedDatabaseBackupList
            )
        end

        # Create a manual backup of a dedicated database. The backup will be created
        # asynchronously and its status can be checked via the get backup endpoint.
        #
        # @param [String] database_id Database ID.
        # @param [String] type Backup type: full or incremental.
        #
        # @return [DedicatedDatabaseBackup]
        def create_backup(
            database_id:,
            type: nil
        )
            api_path = '/mongo/{databaseId}/backups'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                type: type,
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
                response_type: Models::DedicatedDatabaseBackup
            )
        end

        # List scheduled backup policies for a dedicated database.
        #
        # @param [String] database_id Database ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK.
        #
        # @return [BackupPolicyList]
        def list_backup_policies(
            database_id:,
            queries: nil
        )
            api_path = '/mongo/{databaseId}/backups/policies'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

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
                response_type: Models::BackupPolicyList
            )
        end

        # Create a scheduled backup policy for a dedicated database.
        #
        # @param [String] database_id Database ID.
        # @param [String] policy_id Policy ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Policy name. Max length: 128 chars.
        # @param [String] schedule Schedule CRON syntax.
        # @param [Integer] retention Days to keep backups before deletion.
        # @param [String] type Backup type: full or incremental.
        # @param [] enabled Is policy enabled? When disabled, no backups will be taken.
        #
        # @return [BackupPolicy]
        def create_backup_policy(
            database_id:,
            policy_id:,
            name:,
            schedule:,
            retention:,
            type: nil,
            enabled: nil
        )
            api_path = '/mongo/{databaseId}/backups/policies'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if policy_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "policyId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if schedule.nil?
                raise Appwrite::Exception.new('Missing required parameter: "schedule"')
            end

            if retention.nil?
                raise Appwrite::Exception.new('Missing required parameter: "retention"')
            end

            api_params = {
                policyId: policy_id,
                name: name,
                schedule: schedule,
                retention: retention,
                type: type,
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
                response_type: Models::BackupPolicy
            )
        end

        # Get a scheduled backup policy for a dedicated database.
        #
        # @param [String] database_id Database ID.
        # @param [String] policy_id Policy ID.
        #
        # @return [BackupPolicy]
        def get_backup_policy(
            database_id:,
            policy_id:
        )
            api_path = '/mongo/{databaseId}/backups/policies/{policyId}'
                .gsub('{databaseId}', database_id)
                .gsub('{policyId}', policy_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if policy_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "policyId"')
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
                response_type: Models::BackupPolicy
            )
        end

        # Update a scheduled backup policy for a dedicated database.
        #
        # @param [String] database_id Database ID.
        # @param [String] policy_id Policy ID.
        # @param [String] name Policy name. Max length: 128 chars.
        # @param [String] schedule Schedule CRON syntax.
        # @param [Integer] retention Days to keep backups before deletion.
        # @param [] enabled Is policy enabled? When disabled, no backups will be taken.
        #
        # @return [BackupPolicy]
        def update_backup_policy(
            database_id:,
            policy_id:,
            name: nil,
            schedule: nil,
            retention: nil,
            enabled: nil
        )
            api_path = '/mongo/{databaseId}/backups/policies/{policyId}'
                .gsub('{databaseId}', database_id)
                .gsub('{policyId}', policy_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if policy_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "policyId"')
            end

            api_params = {
                name: name,
                schedule: schedule,
                retention: retention,
                enabled: enabled,
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
                response_type: Models::BackupPolicy
            )
        end

        # Delete a scheduled backup policy for a dedicated database. Backups already
        # taken by the policy are kept until their retention expires.
        #
        # @param [String] database_id Database ID.
        # @param [String] policy_id Policy ID.
        #
        # @return []
        def delete_backup_policy(
            database_id:,
            policy_id:
        )
            api_path = '/mongo/{databaseId}/backups/policies/{policyId}'
                .gsub('{databaseId}', database_id)
                .gsub('{policyId}', policy_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if policy_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "policyId"')
            end

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

        # Configure off-cluster backup storage for a dedicated database. Supports S3,
        # GCS, and Azure Blob Storage destinations. Backups will be stored to the
        # configured destination in addition to on-cluster storage.
        #
        # @param [String] database_id Database ID.
        # @param [String] provider Storage provider for off-cluster backups. Allowed values: s3 (Amazon S3 or S3-compatible), gcs (Google Cloud Storage), azure (Azure Blob Storage).
        # @param [String] bucket Storage bucket or container name.
        # @param [String] access_key Access key or client ID for authentication.
        # @param [String] secret_key Secret key or service account JSON for authentication.
        # @param [String] region Storage region.
        # @param [String] prefix Object key prefix for backups.
        # @param [String] endpoint Custom endpoint for S3-compatible storage (e.g. MinIO).
        #
        # @return [DedicatedDatabaseBackupStorage]
        def update_backup_storage(
            database_id:,
            provider:,
            bucket:,
            access_key:,
            secret_key:,
            region: nil,
            prefix: nil,
            endpoint: nil
        )
            api_path = '/mongo/{databaseId}/backups/storage'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if provider.nil?
                raise Appwrite::Exception.new('Missing required parameter: "provider"')
            end

            if bucket.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucket"')
            end

            if access_key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "accessKey"')
            end

            if secret_key.nil?
                raise Appwrite::Exception.new('Missing required parameter: "secretKey"')
            end

            api_params = {
                provider: provider,
                bucket: bucket,
                region: region,
                prefix: prefix,
                endpoint: endpoint,
                accessKey: access_key,
                secretKey: secret_key,
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
                response_type: Models::DedicatedDatabaseBackupStorage
            )
        end

        # Get details of a specific database backup including its status, size, and
        # timestamps.
        #
        # @param [String] database_id Database ID.
        # @param [String] backup_id Backup ID.
        #
        # @return [DedicatedDatabaseBackup]
        def get_backup(
            database_id:,
            backup_id:
        )
            api_path = '/mongo/{databaseId}/backups/{backupId}'
                .gsub('{databaseId}', database_id)
                .gsub('{backupId}', backup_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if backup_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "backupId"')
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
                response_type: Models::DedicatedDatabaseBackup
            )
        end

        # Delete a database backup. This will permanently remove the backup from
        # storage and cannot be undone.
        #
        # @param [String] database_id Database ID.
        # @param [String] backup_id Backup ID.
        #
        # @return []
        def delete_backup(
            database_id:,
            backup_id:
        )
            api_path = '/mongo/{databaseId}/backups/{backupId}'
                .gsub('{databaseId}', database_id)
                .gsub('{backupId}', backup_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if backup_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "backupId"')
            end

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

        # List all ephemeral branches for a dedicated database. Returns branch
        # metadata including ID, name, namespace, and expiration time.
        #
        # @param [String] database_id Database ID.
        #
        # @return [DedicatedDatabaseBranchList]
        def list_branches(
            database_id:
        )
            api_path = '/mongo/{databaseId}/branches'
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
                response_type: Models::DedicatedDatabaseBranchList
            )
        end

        # Create an ephemeral database branch from the primary via PVC snapshot. The
        # branch is a full copy of the database at the current point in time, useful
        # for testing schema migrations or running experiments without affecting
        # production data. Branches expire after the configured TTL (default 24
        # hours). The branch is created asynchronously.
        #
        # @param [String] database_id Database ID.
        # @param [String] branch_id Branch ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [Integer] ttl Time-to-live in seconds before the branch expires. Min 300 (5 min), max 604800 (7 days). Default: 86400 (24h).
        #
        # @return [DedicatedDatabase]
        def create_branch(
            database_id:,
            branch_id: nil,
            ttl: nil
        )
            api_path = '/mongo/{databaseId}/branches'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                branchId: branch_id,
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
                response_type: Models::DedicatedDatabase
            )
        end

        # Delete an ephemeral database branch. This removes the branch namespace, its
        # PVC, and the associated VolumeSnapshot. The deletion runs asynchronously
        # and is irreversible.
        #
        # @param [String] database_id Database ID.
        # @param [String] branch_id Branch ID.
        #
        # @return [DedicatedDatabase]
        def delete_branch(
            database_id:,
            branch_id:
        )
            api_path = '/mongo/{databaseId}/branches/{branchId}'
                .gsub('{databaseId}', database_id)
                .gsub('{branchId}', branch_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if branch_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "branchId"')
            end

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
                response_type: Models::DedicatedDatabase
            )
        end

        # Rotate the primary connection credentials for a dedicated database.
        # Generates a new password and updates the database atomically. Previous
        # credentials stop working immediately. Returns the database with a refreshed
        # connection string carrying the new password.
        #
        # @param [String] database_id Database ID.
        #
        # @return [DedicatedDatabase]
        def update_credentials(
            database_id:
        )
            api_path = '/mongo/{databaseId}/credentials'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

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
                response_type: Models::DedicatedDatabase
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
            api_path = '/mongo/{databaseId}/failovers'
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

        # Update the maintenance window for a dedicated database. Maintenance
        # operations like minor version upgrades will be performed during this
        # window.
        #
        # @param [String] database_id Database ID.
        # @param [String] day Day of the week for the maintenance window. Allowed values: sun, mon, tue, wed, thu, fri, sat.
        # @param [Integer] hour_utc Hour in UTC (0-23) for maintenance window start.
        #
        # @return [DedicatedDatabase]
        def update_maintenance(
            database_id:,
            day:,
            hour_utc:
        )
            api_path = '/mongo/{databaseId}/maintenance'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if day.nil?
                raise Appwrite::Exception.new('Missing required parameter: "day"')
            end

            if hour_utc.nil?
                raise Appwrite::Exception.new('Missing required parameter: "hourUtc"')
            end

            api_params = {
                day: day,
                hourUtc: hour_utc,
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
                response_type: Models::DedicatedDatabase
            )
        end

        # Migrate a database between shared and dedicated types. Shared to dedicated
        # provisions an always-on dedicated instance; dedicated to shared converts to
        # a serverless instance that scales to zero when idle. Data is copied to the
        # target with a brief read-only window during cutover.
        #
        # @param [String] database_id Database ID.
        # @param [String] target_type Target database type to migrate to. Allowed values: shared (serverless, scales to zero when idle), dedicated (always-on with persistent resources).
        # @param [String] specification Target specification to provision when migrating to dedicated. Ignored for shared. Defaults to the database&#039;s current specification.
        #
        # @return [DedicatedDatabase]
        def create_migration(
            database_id:,
            target_type:,
            specification: nil
        )
            api_path = '/mongo/{databaseId}/migrations'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if target_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "targetType"')
            end

            api_params = {
                targetType: target_type,
                specification: specification,
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
            api_path = '/mongo/{databaseId}/operations'
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

        # Get available point-in-time recovery windows for a dedicated database.
        # Returns the earliest and latest recovery points.
        #
        # @param [String] database_id Database ID.
        #
        # @return [DedicatedDatabasePITRWindows]
        def get_pitr(
            database_id:
        )
            api_path = '/mongo/{databaseId}/pitr'
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
                response_type: Models::DedicatedDatabasePITRWindows
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
            api_path = '/mongo/{databaseId}/replicas'
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

        # List all restorations for a dedicated database. Results can be filtered by
        # status and type.
        #
        # @param [String] database_id Database ID.
        # @param [String] status Filter by restoration status.
        # @param [String] type Filter by restoration type.
        # @param [Integer] limit Maximum number of restorations to return.
        # @param [Integer] offset Number of restorations to skip.
        #
        # @return [DedicatedDatabaseRestorationList]
        def list_restorations(
            database_id:,
            status: nil,
            type: nil,
            limit: nil,
            offset: nil
        )
            api_path = '/mongo/{databaseId}/restorations'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                status: status,
                type: type,
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
                response_type: Models::DedicatedDatabaseRestorationList
            )
        end

        # Restore a database from a backup or to a specific point in time (PITR). For
        # backup restoration, provide a backupId. For PITR, provide a targetTime as
        # an ISO 8601 datetime. PITR requires the database to have PITR enabled and
        # is only available for enterprise databases.
        #
        # @param [String] database_id Database ID.
        # @param [String] type Restoration type. Allowed values: backup, pitr. Use &quot;backup&quot; to restore from a specific backup, or &quot;pitr&quot; for point-in-time recovery.
        # @param [String] backup_id Backup ID to restore from (required for backup type).
        # @param [String] target_database_id Existing database ID to restore into. The target must be distinct, ready, and use the same engine and version.
        # @param [String] target_time Target time for PITR (required for pitr type) as an [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) datetime.
        #
        # @return [DedicatedDatabaseRestoration]
        def create_restoration(
            database_id:,
            type: nil,
            backup_id: nil,
            target_database_id: nil,
            target_time: nil
        )
            api_path = '/mongo/{databaseId}/restorations'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            api_params = {
                type: type,
                backupId: backup_id,
                targetDatabaseId: target_database_id,
                targetTime: target_time,
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
                response_type: Models::DedicatedDatabaseRestoration
            )
        end

        # Get details of a specific database restoration including its status, type,
        # and timestamps.
        #
        # @param [String] database_id Database ID.
        # @param [String] restoration_id Restoration ID.
        #
        # @return [DedicatedDatabaseRestoration]
        def get_restoration(
            database_id:,
            restoration_id:
        )
            api_path = '/mongo/{databaseId}/restorations/{restorationId}'
                .gsub('{databaseId}', database_id)
                .gsub('{restorationId}', restoration_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if restoration_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "restorationId"')
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
                response_type: Models::DedicatedDatabaseRestoration
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
            api_path = '/mongo/{databaseId}/status'
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

        # Upgrade a dedicated database to a new engine version. Uses blue-green
        # deployment for zero-downtime cutover.
        #
        # @param [String] database_id Database ID.
        # @param [String] target_version Target engine version to upgrade to.
        #
        # @return [DedicatedDatabase]
        def create_upgrade(
            database_id:,
            target_version:
        )
            api_path = '/mongo/{databaseId}/upgrades'
                .gsub('{databaseId}', database_id)

            if database_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "databaseId"')
            end

            if target_version.nil?
                raise Appwrite::Exception.new('Missing required parameter: "targetVersion"')
            end

            api_params = {
                targetVersion: target_version,
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
    end
end
