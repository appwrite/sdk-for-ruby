# frozen_string_literal: true

module Appwrite
    module Models
        class UserList
            attr_reader :total
            attr_reader :users

            def initialize(
                total:,
                users:
            )
                @total = total
                @users = users
            end

            def self.from(map:)
                map = { "total" => 0, "users" => [] }.merge(map)
                UserList.new(
                    total: map["total"],
                    users: map["users"].map { |it| User.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "users": @users.map { |it| it.to_map }
                }
            end
        end
    end
end
