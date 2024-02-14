#frozen_string_literal: true

module Appwrite
    module Models
        class Token
            attr_reader :id
            attr_reader :created_at
            attr_reader :user_id
            attr_reader :secret
            attr_reader :expire

            def initialize(
                id:,
                created_at:,
                user_id:,
                secret:,
                expire:
            )
                @id = id
                @created_at = created_at
                @user_id = user_id
                @secret = secret
                @expire = expire
            end

            def self.from(map:)
                Token.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    user_id: map["userId"],
                    secret: map["secret"],
                    expire: map["expire"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "userId": @user_id,
                    "secret": @secret,
                    "expire": @expire
                }
            end
        end
    end
end
