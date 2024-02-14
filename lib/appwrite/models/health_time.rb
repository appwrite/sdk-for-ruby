#frozen_string_literal: true

module Appwrite
    module Models
        class HealthTime
            attr_reader :remote_time
            attr_reader :local_time
            attr_reader :diff

            def initialize(
                remote_time:,
                local_time:,
                diff:
            )
                @remote_time = remote_time
                @local_time = local_time
                @diff = diff
            end

            def self.from(map:)
                HealthTime.new(
                    remote_time: map["remoteTime"],
                    local_time: map["localTime"],
                    diff: map["diff"]
                )
            end

            def to_map
                {
                    "remoteTime": @remote_time,
                    "localTime": @local_time,
                    "diff": @diff
                }
            end
        end
    end
end
