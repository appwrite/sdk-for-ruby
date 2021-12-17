#frozen_string_literal: true

module Appwrite
    module Models
        class UserList
            attr_reader :sum
            attr_reader :users

            def initialize(
                sum:,
                users:
            )
                @sum = sum
                @users = users
            end

            def self.from(map:)
                UserList.new(
                    sum: map["sum"],
                    users: map["users"].map { |it| User.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "users": @users.map { |it| it.to_map }
                }
            end
        end
    end
end