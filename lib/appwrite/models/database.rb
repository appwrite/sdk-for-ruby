#frozen_string_literal: true

module Appwrite
    module Models
        class Database
            attr_reader :id
            attr_reader :name
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :enabled
            attr_reader :type
            attr_reader :status
            attr_reader :engine
            attr_reader :specification
            attr_reader :replicas
            attr_reader :policies
            attr_reader :archives

            def initialize(
                id:,
                name:,
                created_at:,
                updated_at:,
                enabled:,
                type:,
                status: ,
                engine: ,
                specification: ,
                replicas: ,
                policies: ,
                archives: 
            )
                @id = id
                @name = name
                @created_at = created_at
                @updated_at = updated_at
                @enabled = enabled
                @type = validate_type(type)
                @status = status.nil? ? status : validate_status(status)
                @engine = engine
                @specification = specification
                @replicas = replicas
                @policies = policies
                @archives = archives
            end

            def self.from(map:)
                Database.new(
                    id: map["$id"],
                    name: map["name"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    enabled: map["enabled"],
                    type: map["type"],
                    status: map["status"],
                    engine: map["engine"],
                    specification: map["specification"],
                    replicas: map["replicas"],
                    policies: map["policies"]&.map { |it| BackupPolicy.from(map: it) },
                    archives: map["archives"]&.map { |it| BackupArchive.from(map: it) }
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "enabled": @enabled,
                    "type": @type,
                    "status": @status,
                    "engine": @engine,
                    "specification": @specification,
                    "replicas": @replicas,
                    "policies": @policies&.map { |it| it.to_map },
                    "archives": @archives&.map { |it| it.to_map }
                }
            end

            private

            def validate_type(type)
                valid_type = [
                    Appwrite::Enums::DatabaseType::LEGACY,
                    Appwrite::Enums::DatabaseType::TABLESDB,
                    Appwrite::Enums::DatabaseType::DOCUMENTSDB,
                    Appwrite::Enums::DatabaseType::VECTORSDB,
                    Appwrite::Enums::DatabaseType::MYSQL,
                    Appwrite::Enums::DatabaseType::POSTGRESQL,
                    Appwrite::Enums::DatabaseType::MONGODB,
                ]

                unless valid_type.include?(type)
                    raise ArgumentError, "Invalid " + type + ". Must be one of: " + valid_type.join(', ')
                end

                type
            end

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::DatabaseStatus::PROVISIONING,
                    Appwrite::Enums::DatabaseStatus::READY,
                    Appwrite::Enums::DatabaseStatus::INACTIVE,
                    Appwrite::Enums::DatabaseStatus::PAUSED,
                    Appwrite::Enums::DatabaseStatus::FAILED,
                    Appwrite::Enums::DatabaseStatus::DELETING,
                    Appwrite::Enums::DatabaseStatus::DELETED,
                    Appwrite::Enums::DatabaseStatus::RESTORING,
                    Appwrite::Enums::DatabaseStatus::SCALING,
                    Appwrite::Enums::DatabaseStatus::UPGRADING,
                    Appwrite::Enums::DatabaseStatus::MIGRATING,
                    Appwrite::Enums::DatabaseStatus::PAUSING,
                    Appwrite::Enums::DatabaseStatus::RESUMING,
                    Appwrite::Enums::DatabaseStatus::FAILING-OVER,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
