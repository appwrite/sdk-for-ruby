#frozen_string_literal: true

module Appwrite
    module Models
        class HealthAntivirus
            attr_reader :version
            attr_reader :status

            def initialize(
                version:,
                status:
            )
                @version = version
                @status = validate_status(status)
            end

            def self.from(map:)
                HealthAntivirus.new(
                    version: map["version"],
                    status: map["status"]
                )
            end

            def to_map
                {
                    "version": @version,
                    "status": @status
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::HealthAntivirusStatus::DISABLED,
                    Appwrite::Enums::HealthAntivirusStatus::OFFLINE,
                    Appwrite::Enums::HealthAntivirusStatus::ONLINE,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
