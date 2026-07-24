#frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseStatus
            attr_reader :health
            attr_reader :ready
            attr_reader :engine
            attr_reader :version
            attr_reader :uptime
            attr_reader :connections
            attr_reader :replicas
            attr_reader :volumes

            def initialize(
                health:,
                ready:,
                engine:,
                version:,
                uptime:,
                connections:,
                replicas:,
                volumes:
            )
                @health = health
                @ready = ready
                @engine = engine
                @version = version
                @uptime = uptime
                @connections = connections
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
                    "replicas": @replicas.map { |it| it.to_map },
                    "volumes": @volumes.map { |it| it.to_map }
                }
            end
        end
    end
end
