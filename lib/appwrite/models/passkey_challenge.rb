# frozen_string_literal: true

module Appwrite
    module Models
        class PasskeyChallenge
            attr_reader :id
            attr_reader :created_at
            attr_reader :passkey_id
            attr_reader :expire
            attr_reader :public_key

            def initialize(
                id:,
                created_at:,
                passkey_id:,
                expire:,
                public_key:
            )
                @id = id
                @created_at = created_at
                @passkey_id = passkey_id
                @expire = expire
                @public_key = public_key
            end

            def self.from(map:)
                PasskeyChallenge.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    passkey_id: map["passkeyId"],
                    expire: map["expire"],
                    public_key: map["publicKey"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "passkeyId": @passkey_id,
                    "expire": @expire,
                    "publicKey": @public_key
                }
            end
        end
    end
end
