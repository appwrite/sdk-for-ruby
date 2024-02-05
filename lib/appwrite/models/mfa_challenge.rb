#frozen_string_literal: true

module Appwrite
    module Models
        class MfaChallenge
            attr_reader :id
            attr_reader :created_at
            attr_reader :user_id
            attr_reader :expire

            def initialize(
                id:,
                created_at:,
                user_id:,
                expire:
            )
                @id = id
                @created_at = created_at
                @user_id = user_id
                @expire = expire
            end

            def self.from(map:)
                MfaChallenge.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    user_id: map["userId"],
                    expire: map["expire"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "userId": @user_id,
                    "expire": @expire
                }
            end
        end
    end
end