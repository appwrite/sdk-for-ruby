# frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseStatus
            attr_reader :health
            attr_reader :ready
            attr_reader :engine
            attr_reader :version
            attr_reader :uptime
            attr_reader :connections
            attr_reader :sync_mode
            attr_reader :effective_sync_mode
            attr_reader :sync_degraded
            attr_reader :sync_acknowledgements
            attr_reader :sync_standby_count
            attr_reader :sync_state_confirmed
            attr_reader :replicas
            attr_reader :volumes

            def initialize(
                health:,
                ready:,
                engine:,
                version:,
                uptime:,
                connections:,
                sync_mode:,
                effective_sync_mode:,
                sync_degraded:,
                sync_acknowledgements:,
                sync_standby_count:,
                sync_state_confirmed:,
                replicas:,
                volumes:
            )
                @health = health
                @ready = ready
                @engine = engine
                @version = version
                @uptime = uptime
                @connections = connections
                @sync_mode = sync_mode
                @effective_sync_mode = effective_sync_mode
                @sync_degraded = sync_degraded
                @sync_acknowledgements = sync_acknowledgements
                @sync_standby_count = sync_standby_count
                @sync_state_confirmed = sync_state_confirmed
                @replicas = replicas
                @volumes = volumes
            end

            def self.from(map:)
                DatabaseStatus.new(
                    health: map["health"],
                    ready: map["ready"],
                    engine: map["engine"],
                    version: map["version"],
                    uptime: map["uptime"],
                    connections: DatabaseStatusConnections.from(map: map["connections"]),
                    sync_mode: map["syncMode"],
                    effective_sync_mode: map["effectiveSyncMode"],
                    sync_degraded: map["syncDegraded"],
                    sync_acknowledgements: map["syncAcknowledgements"],
                    sync_standby_count: map["syncStandbyCount"],
                    sync_state_confirmed: map["syncStateConfirmed"],
                    replicas: map["replicas"].map { |it| DatabaseStatusReplica.from(map: it) },
                    volumes: map["volumes"].map { |it| DatabaseStatusVolume.from(map: it) }
                )
            end

            def to_map
                {
                    "health": @health,
                    "ready": @ready,
                    "engine": @engine,
                    "version": @version,
                    "uptime": @uptime,
                    "connections": @connections.to_map,
                    "syncMode": @sync_mode,
                    "effectiveSyncMode": @effective_sync_mode,
                    "syncDegraded": @sync_degraded,
                    "syncAcknowledgements": @sync_acknowledgements,
                    "syncStandbyCount": @sync_standby_count,
                    "syncStateConfirmed": @sync_state_confirmed,
                    "replicas": @replicas.map { |it| it.to_map },
                    "volumes": @volumes.map { |it| it.to_map }
                }
            end
        end
    end
end
