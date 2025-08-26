#frozen_string_literal: true

module Appwrite
    module Models
        class Index
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :attributes
            attr_reader :lengths
            attr_reader :orders

            def initialize(
                id:,
                created_at:,
                updated_at:,
                key:,
                type:,
                status:,
                error:,
                attributes:,
                lengths:,
                orders: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @key = key
                @type = type
                @status = status
                @error = error
                @attributes = attributes
                @lengths = lengths
                @orders = orders
            end

            def self.from(map:)
                Index.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    attributes: map["attributes"],
                    lengths: map["lengths"],
                    orders: map["orders"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "key": @key,
                    "type": @type,
                    "status": @status,
                    "error": @error,
                    "attributes": @attributes,
                    "lengths": @lengths,
                    "orders": @orders
                }
            end
        end
    end
end
