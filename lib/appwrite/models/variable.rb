# frozen_string_literal: true

module Appwrite
    module Models
        class Variable
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :key
            attr_reader :description
            attr_reader :value
            attr_reader :secret
            attr_reader :resource_type
            attr_reader :resource_id

            def initialize(
                id:,
                created_at:,
                updated_at:,
                key:,
                description:,
                value:,
                secret:,
                resource_type:,
                resource_id:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @key = key
                @description = description
                @value = value
                @secret = secret
                @resource_type = resource_type
                @resource_id = resource_id
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "key" => "", "description" => "", "value" => "", "secret" => false, "resourceType" => "", "resourceId" => "" }.merge(map)
                Variable.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    key: map["key"],
                    description: map["description"],
                    value: map["value"],
                    secret: map["secret"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "key": @key,
                    "description": @description,
                    "value": @value,
                    "secret": @secret,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id
                }
            end
        end
    end
end
