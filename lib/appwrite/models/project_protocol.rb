#frozen_string_literal: true

module Appwrite
    module Models
        class ProjectProtocol
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
                ProjectProtocol.new(
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
                    Appwrite::Enums::ProjectProtocolId::REST,
                    Appwrite::Enums::ProjectProtocolId::GRAPHQL,
                    Appwrite::Enums::ProjectProtocolId::WEBSOCKET,
                ]

                unless valid_id.include?(id)
                    raise ArgumentError, "Invalid " + id + ". Must be one of: " + valid_id.join(', ')
                end

                id
            end

        end
    end
end
