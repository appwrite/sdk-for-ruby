# frozen_string_literal: true

module Appwrite
    module Models
        class EscalationStep
            attr_reader :delay
            attr_reader :roles
            attr_reader :user_ids

            def initialize(
                delay:,
                roles:,
                user_ids:
            )
                @delay = delay
                @roles = roles
                @user_ids = user_ids
            end

            def self.from(map:)
                map = { "delay" => 0, "roles" => [], "userIds" => [] }.merge(map)
                EscalationStep.new(
                    delay: map["delay"],
                    roles: map["roles"],
                    user_ids: map["userIds"]
                )
            end

            def to_map
                {
                    "delay": @delay,
                    "roles": @roles,
                    "userIds": @user_ids
                }
            end
        end
    end
end
