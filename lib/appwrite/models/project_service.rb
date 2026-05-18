#frozen_string_literal: true

module Appwrite
    module Models
        class ProjectService
            attr_reader :id
            attr_reader :enabled

            def initialize(
                id:,
                enabled:
            )
                @id = validate_id(id)
                @enabled = enabled
            end

            def self.from(map:)
                ProjectService.new(
                    id: map["$id"],
                    enabled: map["enabled"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled
                }
            end

            private

            def validate_id(id)
                valid_id = [
                    Appwrite::Enums::ProjectServiceId::ACCOUNT,
                    Appwrite::Enums::ProjectServiceId::AVATARS,
                    Appwrite::Enums::ProjectServiceId::DATABASES,
                    Appwrite::Enums::ProjectServiceId::TABLESDB,
                    Appwrite::Enums::ProjectServiceId::LOCALE,
                    Appwrite::Enums::ProjectServiceId::HEALTH,
                    Appwrite::Enums::ProjectServiceId::PROJECT,
                    Appwrite::Enums::ProjectServiceId::STORAGE,
                    Appwrite::Enums::ProjectServiceId::TEAMS,
                    Appwrite::Enums::ProjectServiceId::USERS,
                    Appwrite::Enums::ProjectServiceId::VCS,
                    Appwrite::Enums::ProjectServiceId::SITES,
                    Appwrite::Enums::ProjectServiceId::FUNCTIONS,
                    Appwrite::Enums::ProjectServiceId::PROXY,
                    Appwrite::Enums::ProjectServiceId::GRAPHQL,
                    Appwrite::Enums::ProjectServiceId::MIGRATIONS,
                    Appwrite::Enums::ProjectServiceId::MESSAGING,
                    Appwrite::Enums::ProjectServiceId::ADVISOR,
                ]

                unless valid_id.include?(id)
                    raise ArgumentError, "Invalid " + id + ". Must be one of: " + valid_id.join(', ')
                end

                id
            end

        end
    end
end
