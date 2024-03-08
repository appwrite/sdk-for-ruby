#frozen_string_literal: true

module Appwrite
    module Models
        class Topic
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :email_total
            attr_reader :sms_total
            attr_reader :push_total
            attr_reader :subscribe

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                email_total:,
                sms_total:,
                push_total:,
                subscribe:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @email_total = email_total
                @sms_total = sms_total
                @push_total = push_total
                @subscribe = subscribe
            end

            def self.from(map:)
                Topic.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    email_total: map["emailTotal"],
                    sms_total: map["smsTotal"],
                    push_total: map["pushTotal"],
                    subscribe: map["subscribe"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "emailTotal": @email_total,
                    "smsTotal": @sms_total,
                    "pushTotal": @push_total,
                    "subscribe": @subscribe
                }
            end
        end
    end
end
