#frozen_string_literal: true

module Appwrite
    module Models
        class HealthStatus
            attr_reader :ping
            attr_reader :status

            def initialize(
                ping:,
                status:
            )
                @ping = ping
                @status = status
            end

            def self.from(map:)
                HealthStatus.new(
                    ping: map["ping"],
                    status: map["status"]
                )
            end

            def to_map
                {
                    "ping": @ping,
                    "status": @status
                }
            end
        end
    end
end