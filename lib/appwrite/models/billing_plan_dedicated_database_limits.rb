#frozen_string_literal: true

module Appwrite
    module Models
        class BillingPlanDedicatedDatabaseLimits
            attr_reader :min_cpu
            attr_reader :max_cpu
            attr_reader :min_memory_mb
            attr_reader :max_memory_mb
            attr_reader :min_storage_gb
            attr_reader :max_storage_gb
            attr_reader :max_replicas
            attr_reader :max_connections
            attr_reader :max_ip_allowlist_size
            attr_reader :max_extensions
            attr_reader :max_backup_retention_days
            attr_reader :max_pitr_retention_days
            attr_reader :max_sql_api_max_rows
            attr_reader :max_sql_api_max_bytes
            attr_reader :max_sql_api_timeout_seconds
            attr_reader :max_sql_api_allowed_statements
            attr_reader :allowed_sql_statements
            attr_reader :allowed_storage_classes
            attr_reader :allowed_sync_modes

            def initialize(
                min_cpu: ,
                max_cpu: ,
                min_memory_mb: ,
                max_memory_mb: ,
                min_storage_gb: ,
                max_storage_gb: ,
                max_replicas: ,
                max_connections: ,
                max_ip_allowlist_size: ,
                max_extensions: ,
                max_backup_retention_days: ,
                max_pitr_retention_days: ,
                max_sql_api_max_rows: ,
                max_sql_api_max_bytes: ,
                max_sql_api_timeout_seconds: ,
                max_sql_api_allowed_statements: ,
                allowed_sql_statements: ,
                allowed_storage_classes: ,
                allowed_sync_modes: 
            )
                @min_cpu = min_cpu
                @max_cpu = max_cpu
                @min_memory_mb = min_memory_mb
                @max_memory_mb = max_memory_mb
                @min_storage_gb = min_storage_gb
                @max_storage_gb = max_storage_gb
                @max_replicas = max_replicas
                @max_connections = max_connections
                @max_ip_allowlist_size = max_ip_allowlist_size
                @max_extensions = max_extensions
                @max_backup_retention_days = max_backup_retention_days
                @max_pitr_retention_days = max_pitr_retention_days
                @max_sql_api_max_rows = max_sql_api_max_rows
                @max_sql_api_max_bytes = max_sql_api_max_bytes
                @max_sql_api_timeout_seconds = max_sql_api_timeout_seconds
                @max_sql_api_allowed_statements = max_sql_api_allowed_statements
                @allowed_sql_statements = allowed_sql_statements
                @allowed_storage_classes = allowed_storage_classes
                @allowed_sync_modes = allowed_sync_modes
            end

            def self.from(map:)
                BillingPlanDedicatedDatabaseLimits.new(
                    min_cpu: map["minCpu"],
                    max_cpu: map["maxCpu"],
                    min_memory_mb: map["minMemoryMb"],
                    max_memory_mb: map["maxMemoryMb"],
                    min_storage_gb: map["minStorageGb"],
                    max_storage_gb: map["maxStorageGb"],
                    max_replicas: map["maxReplicas"],
                    max_connections: map["maxConnections"],
                    max_ip_allowlist_size: map["maxIpAllowlistSize"],
                    max_extensions: map["maxExtensions"],
                    max_backup_retention_days: map["maxBackupRetentionDays"],
                    max_pitr_retention_days: map["maxPitrRetentionDays"],
                    max_sql_api_max_rows: map["maxSqlApiMaxRows"],
                    max_sql_api_max_bytes: map["maxSqlApiMaxBytes"],
                    max_sql_api_timeout_seconds: map["maxSqlApiTimeoutSeconds"],
                    max_sql_api_allowed_statements: map["maxSqlApiAllowedStatements"],
                    allowed_sql_statements: map["allowedSqlStatements"],
                    allowed_storage_classes: map["allowedStorageClasses"],
                    allowed_sync_modes: map["allowedSyncModes"]
                )
            end

            def to_map
                {
                    "minCpu": @min_cpu,
                    "maxCpu": @max_cpu,
                    "minMemoryMb": @min_memory_mb,
                    "maxMemoryMb": @max_memory_mb,
                    "minStorageGb": @min_storage_gb,
                    "maxStorageGb": @max_storage_gb,
                    "maxReplicas": @max_replicas,
                    "maxConnections": @max_connections,
                    "maxIpAllowlistSize": @max_ip_allowlist_size,
                    "maxExtensions": @max_extensions,
                    "maxBackupRetentionDays": @max_backup_retention_days,
                    "maxPitrRetentionDays": @max_pitr_retention_days,
                    "maxSqlApiMaxRows": @max_sql_api_max_rows,
                    "maxSqlApiMaxBytes": @max_sql_api_max_bytes,
                    "maxSqlApiTimeoutSeconds": @max_sql_api_timeout_seconds,
                    "maxSqlApiAllowedStatements": @max_sql_api_allowed_statements,
                    "allowedSqlStatements": @allowed_sql_statements,
                    "allowedStorageClasses": @allowed_storage_classes,
                    "allowedSyncModes": @allowed_sync_modes
                }
            end
        end
    end
end
