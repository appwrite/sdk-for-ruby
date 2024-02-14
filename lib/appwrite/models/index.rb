#frozen_string_literal: true

module Appwrite
    module Models
        class Index
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :attributes
            attr_reader :orders

            def initialize(
                key:,
                type:,
                status:,
                error:,
                attributes:,
                orders: 
            )
                @key = key
                @type = type
                @status = status
                @error = error
                @attributes = attributes
                @orders = orders
            end

            def self.from(map:)
                Index.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    attributes: map["attributes"],
                    orders: map["orders"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "type": @type,
                    "status": @status,
                    "error": @error,
                    "attributes": @attributes,
                    "orders": @orders
                }
            end
        end
    end
end
