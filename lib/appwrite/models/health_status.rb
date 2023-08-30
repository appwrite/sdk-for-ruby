#frozen_string_literal: true

module Appwrite
    module Models
        class HealthStatus
            attr_reader :name
            attr_reader :ping
            attr_reader :status

            def initialize(
                name:,
                ping:,
                status:
            )
                @name = name
                @ping = ping
                @status = status
            end

            def self.from(map:)
                HealthStatus.new(
                    name: map["name"],
                    ping: map["ping"],
                    status: map["status"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "ping": @ping,
                    "status": @status
                }
            end
        end
    end
end