#frozen_string_literal: true

module Appwrite
    module Models
        class Message
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :provider_type
            attr_reader :topics
            attr_reader :users
            attr_reader :targets
            attr_reader :scheduled_at
            attr_reader :delivered_at
            attr_reader :delivery_errors
            attr_reader :delivered_total
            attr_reader :data
            attr_reader :status

            def initialize(
                id:,
                created_at:,
                updated_at:,
                provider_type:,
                topics:,
                users:,
                targets:,
                scheduled_at: ,
                delivered_at: ,
                delivery_errors: ,
                delivered_total:,
                data:,
                status:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @provider_type = provider_type
                @topics = topics
                @users = users
                @targets = targets
                @scheduled_at = scheduled_at
                @delivered_at = delivered_at
                @delivery_errors = delivery_errors
                @delivered_total = delivered_total
                @data = data
                @status = status
            end

            def self.from(map:)
                Message.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    provider_type: map["providerType"],
                    topics: map["topics"],
                    users: map["users"],
                    targets: map["targets"],
                    scheduled_at: map["scheduledAt"],
                    delivered_at: map["deliveredAt"],
                    delivery_errors: map["deliveryErrors"],
                    delivered_total: map["deliveredTotal"],
                    data: map["data"],
                    status: map["status"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "providerType": @provider_type,
                    "topics": @topics,
                    "users": @users,
                    "targets": @targets,
                    "scheduledAt": @scheduled_at,
                    "deliveredAt": @delivered_at,
                    "deliveryErrors": @delivery_errors,
                    "deliveredTotal": @delivered_total,
                    "data": @data,
                    "status": @status
                }
            end
        end
    end
end