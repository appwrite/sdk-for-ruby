#frozen_string_literal: true

module Appwrite
    module Models
        class Subscriber
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :target_id
            attr_reader :target
            attr_reader :user_id
            attr_reader :user_name
            attr_reader :topic_id
            attr_reader :provider_type

            def initialize(
                id:,
                created_at:,
                updated_at:,
                target_id:,
                target:,
                user_id:,
                user_name:,
                topic_id:,
                provider_type:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @target_id = target_id
                @target = target
                @user_id = user_id
                @user_name = user_name
                @topic_id = topic_id
                @provider_type = provider_type
            end

            def self.from(map:)
                Subscriber.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    target_id: map["targetId"],
                    target: Target.from(map: map["target"]),
                    user_id: map["userId"],
                    user_name: map["userName"],
                    topic_id: map["topicId"],
                    provider_type: map["providerType"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "targetId": @target_id,
                    "target": @target.to_map,
                    "userId": @user_id,
                    "userName": @user_name,
                    "topicId": @topic_id,
                    "providerType": @provider_type
                }
            end
        end
    end
end