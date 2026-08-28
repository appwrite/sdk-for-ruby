# frozen_string_literal: true

module Appwrite
    module Models
        class MfaChallengeSecret
            attr_reader :id
            attr_reader :created_at
            attr_reader :user_id
            attr_reader :expire
            attr_reader :code

            def initialize(
                id:,
                created_at:,
                user_id:,
                expire:,
                code:
            )
                @id = id
                @created_at = created_at
                @user_id = user_id
                @expire = expire
                @code = code
            end

            def self.from(map:)
                MfaChallengeSecret.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    user_id: map["userId"],
                    expire: map["expire"],
                    code: map["code"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "userId": @user_id,
                    "expire": @expire,
                    "code": @code
                }
            end
        end
    end
end
