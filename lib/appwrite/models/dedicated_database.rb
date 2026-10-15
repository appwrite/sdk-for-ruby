# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabase
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :project_id
            attr_reader :name
            attr_reader :api
            attr_reader :engine
            attr_reader :version
            attr_reader :specification
            attr_reader :backend
            attr_reader :hostname
            attr_reader :connection_port
            attr_reader :connection_user
            attr_reader :connection_password
            attr_reader :credential_generation
            attr_reader :connection_string
            attr_reader :ssl
            attr_reader :status
            attr_reader :container_status
            attr_reader :last_accessed_at
            attr_reader :idle_until
            attr_reader :lifecycle_state
            attr_reader :idle_timeout_minutes
            attr_reader :cpu
            attr_reader :memory
            attr_reader :storage
            attr_reader :storage_status
            attr_reader :storage_target_gb
            attr_reader :storage_resize_started_at
            attr_reader :storage_class
            attr_reader :storage_max_gb
            attr_reader :node_pool
            attr_reader :replicas
            attr_reader :sync_mode
            attr_reader :network_max_connections
            attr_reader :network_idle_timeout_seconds
            attr_reader :network_ip_allowlist
            attr_reader :backup_enabled
            attr_reader :pitr
            attr_reader :pitr_retention_days
            attr_reader :storage_autoscaling
            attr_reader :storage_autoscaling_threshold_percent
            attr_reader :storage_autoscaling_max_gb
            attr_reader :maintenance_window_day
            attr_reader :maintenance_window_hour_utc
            attr_reader :metrics_enabled
            attr_reader :sql_api_enabled
            attr_reader :sql_api_allowed_statements
            attr_reader :sql_api_max_rows
            attr_reader :sql_api_max_bytes
            attr_reader :sql_api_timeout_seconds
            attr_reader :error

            def initialize(
                id:,
                created_at:,
                updated_at:,
                project_id:,
                name:,
                api: nil,
                engine: nil,
                version:,
                specification:,
                backend:,
                hostname:,
                connection_port: nil,
                connection_user:,
                connection_password:,
                credential_generation: nil,
                connection_string:,
                ssl:,
                status:,
                container_status:,
                last_accessed_at: nil,
                idle_until: nil,
                lifecycle_state:,
                idle_timeout_minutes:,
                cpu:,
                memory:,
                storage:,
                storage_status:,
                storage_target_gb:,
                storage_resize_started_at: nil,
                storage_class:,
                storage_max_gb:,
                node_pool:,
                replicas:,
                sync_mode:,
                network_max_connections:,
                network_idle_timeout_seconds:,
                network_ip_allowlist:,
                backup_enabled:,
                pitr:,
                pitr_retention_days:,
                storage_autoscaling:,
                storage_autoscaling_threshold_percent:,
                storage_autoscaling_max_gb:,
                maintenance_window_day:,
                maintenance_window_hour_utc:,
                metrics_enabled:,
                sql_api_enabled:,
                sql_api_allowed_statements:,
                sql_api_max_rows:,
                sql_api_max_bytes:,
                sql_api_timeout_seconds:,
                error:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @project_id = project_id
                @name = name
                @api = api
                @engine = engine
                @version = version
                @specification = specification
                @backend = backend
                @hostname = hostname
                @connection_port = connection_port
                @connection_user = connection_user
                @connection_password = connection_password
                @credential_generation = credential_generation
                @connection_string = connection_string
                @ssl = ssl
                @status = status
                @container_status = container_status
                @last_accessed_at = last_accessed_at
                @idle_until = idle_until
                @lifecycle_state = lifecycle_state
                @idle_timeout_minutes = idle_timeout_minutes
                @cpu = cpu
                @memory = memory
                @storage = storage
                @storage_status = storage_status
                @storage_target_gb = storage_target_gb
                @storage_resize_started_at = storage_resize_started_at
                @storage_class = storage_class
                @storage_max_gb = storage_max_gb
                @node_pool = node_pool
                @replicas = replicas
                @sync_mode = sync_mode
                @network_max_connections = network_max_connections
                @network_idle_timeout_seconds = network_idle_timeout_seconds
                @network_ip_allowlist = network_ip_allowlist
                @backup_enabled = backup_enabled
                @pitr = pitr
                @pitr_retention_days = pitr_retention_days
                @storage_autoscaling = storage_autoscaling
                @storage_autoscaling_threshold_percent = storage_autoscaling_threshold_percent
                @storage_autoscaling_max_gb = storage_autoscaling_max_gb
                @maintenance_window_day = maintenance_window_day
                @maintenance_window_hour_utc = maintenance_window_hour_utc
                @metrics_enabled = metrics_enabled
                @sql_api_enabled = sql_api_enabled
                @sql_api_allowed_statements = sql_api_allowed_statements
                @sql_api_max_rows = sql_api_max_rows
                @sql_api_max_bytes = sql_api_max_bytes
                @sql_api_timeout_seconds = sql_api_timeout_seconds
                @error = error
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "projectId" => "", "name" => "", "version" => "", "specification" => "", "backend" => "", "hostname" => "", "connectionUser" => "", "connectionPassword" => "", "connectionString" => "", "ssl" => false, "status" => "provisioning", "containerStatus" => "", "lifecycleState" => "", "idleTimeoutMinutes" => 15, "cpu" => 500, "memory" => 512, "storage" => 10, "storageStatus" => "idle", "storageTargetGb" => 0, "storageClass" => "ssd", "storageMaxGb" => 0, "nodePool" => "", "replicas" => 0, "syncMode" => "", "networkMaxConnections" => 100, "networkIdleTimeoutSeconds" => 900, "networkIPAllowlist" => [], "backupEnabled" => true, "pitr" => true, "pitrRetentionDays" => 7, "storageAutoscaling" => true, "storageAutoscalingThresholdPercent" => 85, "storageAutoscalingMaxGb" => 0, "maintenanceWindowDay" => "sun", "maintenanceWindowHourUtc" => 3, "metricsEnabled" => false, "sqlApiEnabled" => true, "sqlApiAllowedStatements" => ["SELECT", "INSERT", "UPDATE", "DELETE"], "sqlApiMaxRows" => 10000, "sqlApiMaxBytes" => 10485760, "sqlApiTimeoutSeconds" => 30, "error" => "" }.merge(map)
                DedicatedDatabase.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    project_id: map["projectId"],
                    name: map["name"],
                    api: map["api"],
                    engine: map["engine"],
                    version: map["version"],
                    specification: map["specification"],
                    backend: map["backend"],
                    hostname: map["hostname"],
                    connection_port: map["connectionPort"],
                    connection_user: map["connectionUser"],
                    connection_password: map["connectionPassword"],
                    credential_generation: map["credentialGeneration"],
                    connection_string: map["connectionString"],
                    ssl: map["ssl"],
                    status: map["status"],
                    container_status: map["containerStatus"],
                    last_accessed_at: map["lastAccessedAt"],
                    idle_until: map["idleUntil"],
                    lifecycle_state: map["lifecycleState"],
                    idle_timeout_minutes: map["idleTimeoutMinutes"],
                    cpu: map["cpu"],
                    memory: map["memory"],
                    storage: map["storage"],
                    storage_status: map["storageStatus"],
                    storage_target_gb: map["storageTargetGb"],
                    storage_resize_started_at: map["storageResizeStartedAt"],
                    storage_class: map["storageClass"],
                    storage_max_gb: map["storageMaxGb"],
                    node_pool: map["nodePool"],
                    replicas: map["replicas"],
                    sync_mode: map["syncMode"],
                    network_max_connections: map["networkMaxConnections"],
                    network_idle_timeout_seconds: map["networkIdleTimeoutSeconds"],
                    network_ip_allowlist: map["networkIPAllowlist"],
                    backup_enabled: map["backupEnabled"],
                    pitr: map["pitr"],
                    pitr_retention_days: map["pitrRetentionDays"],
                    storage_autoscaling: map["storageAutoscaling"],
                    storage_autoscaling_threshold_percent: map["storageAutoscalingThresholdPercent"],
                    storage_autoscaling_max_gb: map["storageAutoscalingMaxGb"],
                    maintenance_window_day: map["maintenanceWindowDay"],
                    maintenance_window_hour_utc: map["maintenanceWindowHourUtc"],
                    metrics_enabled: map["metricsEnabled"],
                    sql_api_enabled: map["sqlApiEnabled"],
                    sql_api_allowed_statements: map["sqlApiAllowedStatements"],
                    sql_api_max_rows: map["sqlApiMaxRows"],
                    sql_api_max_bytes: map["sqlApiMaxBytes"],
                    sql_api_timeout_seconds: map["sqlApiTimeoutSeconds"],
                    error: map["error"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "projectId": @project_id,
                    "name": @name,
                    "api": @api,
                    "engine": @engine,
                    "version": @version,
                    "specification": @specification,
                    "backend": @backend,
                    "hostname": @hostname,
                    "connectionPort": @connection_port,
                    "connectionUser": @connection_user,
                    "connectionPassword": @connection_password,
                    "credentialGeneration": @credential_generation,
                    "connectionString": @connection_string,
                    "ssl": @ssl,
                    "status": @status,
                    "containerStatus": @container_status,
                    "lastAccessedAt": @last_accessed_at,
                    "idleUntil": @idle_until,
                    "lifecycleState": @lifecycle_state,
                    "idleTimeoutMinutes": @idle_timeout_minutes,
                    "cpu": @cpu,
                    "memory": @memory,
                    "storage": @storage,
                    "storageStatus": @storage_status,
                    "storageTargetGb": @storage_target_gb,
                    "storageResizeStartedAt": @storage_resize_started_at,
                    "storageClass": @storage_class,
                    "storageMaxGb": @storage_max_gb,
                    "nodePool": @node_pool,
                    "replicas": @replicas,
                    "syncMode": @sync_mode,
                    "networkMaxConnections": @network_max_connections,
                    "networkIdleTimeoutSeconds": @network_idle_timeout_seconds,
                    "networkIPAllowlist": @network_ip_allowlist,
                    "backupEnabled": @backup_enabled,
                    "pitr": @pitr,
                    "pitrRetentionDays": @pitr_retention_days,
                    "storageAutoscaling": @storage_autoscaling,
                    "storageAutoscalingThresholdPercent": @storage_autoscaling_threshold_percent,
                    "storageAutoscalingMaxGb": @storage_autoscaling_max_gb,
                    "maintenanceWindowDay": @maintenance_window_day,
                    "maintenanceWindowHourUtc": @maintenance_window_hour_utc,
                    "metricsEnabled": @metrics_enabled,
                    "sqlApiEnabled": @sql_api_enabled,
                    "sqlApiAllowedStatements": @sql_api_allowed_statements,
                    "sqlApiMaxRows": @sql_api_max_rows,
                    "sqlApiMaxBytes": @sql_api_max_bytes,
                    "sqlApiTimeoutSeconds": @sql_api_timeout_seconds,
                    "error": @error
                }
            end
        end
    end
end
