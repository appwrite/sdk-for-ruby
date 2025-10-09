#frozen_string_literal: true

module Appwrite
    module Models
        class Transaction
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :status
            attr_reader :operations
            attr_reader :expires_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                status:,
                operations:,
                expires_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @status = status
                @operations = operations
                @expires_at = expires_at
            end

            def self.from(map:)
                Transaction.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    status: map["status"],
                    operations: map["operations"],
                    expires_at: map["expiresAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "status": @status,
                    "operations": @operations,
                    "expiresAt": @expires_at
                }
            end
        end
    end
end
