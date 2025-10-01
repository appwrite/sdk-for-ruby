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
                @status = validate_status(status)
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

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::HealthCheckStatus::PASS,
                    Appwrite::Enums::HealthCheckStatus::FAIL,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
