# frozen_string_literal: true

module Appwrite
    module Models
        class AnalyticsAnnotation
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :property_id
            attr_reader :date
            attr_reader :content
            attr_reader :user_id

            def initialize(
                id:,
                created_at:,
                updated_at:,
                property_id:,
                date:,
                content:,
                user_id:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @property_id = property_id
                @date = date
                @content = content
                @user_id = user_id
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "propertyId" => "", "date" => "", "content" => "", "userId" => "" }.merge(map)
                AnalyticsAnnotation.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    property_id: map["propertyId"],
                    date: map["date"],
                    content: map["content"],
                    user_id: map["userId"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "propertyId": @property_id,
                    "date": @date,
                    "content": @content,
                    "userId": @user_id
                }
            end
        end
    end
end
