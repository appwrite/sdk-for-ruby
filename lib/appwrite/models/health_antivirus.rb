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
                @status = status
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
        end
    end
end