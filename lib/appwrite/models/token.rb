#frozen_string_literal: true

module Appwrite
    module Models
        class Token
            attr_reader :id
            attr_reader :user_id
            attr_reader :secret
            attr_reader :expire

            def initialize(
                id:,
                user_id:,
                secret:,
                expire:
            )
                @id = id
                @user_id = user_id
                @secret = secret
                @expire = expire
            end

            def self.from(map:)
                Token.new(
                    id: map["$id"],
                    user_id: map["userId"],
                    secret: map["secret"],
                    expire: map["expire"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "userId": @user_id,
                    "secret": @secret,
                    "expire": @expire
                }
            end
        end
    end
end