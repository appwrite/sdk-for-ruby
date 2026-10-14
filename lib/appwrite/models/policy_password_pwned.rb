# frozen_string_literal: true

module Appwrite
    module Models
        class PolicyPasswordPwned
            attr_reader :id
            attr_reader :enabled
            attr_reader :sessions
            attr_reader :users

            def initialize(
                id:,
                enabled:,
                sessions:,
                users:
            )
                @id = id
                @enabled = enabled
                @sessions = sessions
                @users = users
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => true, "sessions" => false, "users" => false }.merge(map)
                PolicyPasswordPwned.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    sessions: map["sessions"],
                    users: map["users"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "sessions": @sessions,
                    "users": @users
                }
            end
        end
    end
end
