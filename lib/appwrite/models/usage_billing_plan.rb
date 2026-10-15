# frozen_string_literal: true

module Appwrite
    module Models
        class UsageBillingPlan
            attr_reader :bandwidth
            attr_reader :executions
            attr_reader :member
            attr_reader :realtime
            attr_reader :realtime_messages
            attr_reader :realtime_bandwidth
            attr_reader :storage
            attr_reader :users
            attr_reader :gb_hours
            attr_reader :image_transformations
            attr_reader :credits

            def initialize(
                bandwidth: nil,
                executions: nil,
                member: nil,
                realtime: nil,
                realtime_messages: nil,
                realtime_bandwidth: nil,
                storage: nil,
                users: nil,
                gb_hours: nil,
                image_transformations: nil,
                credits: nil
            )
                @bandwidth = bandwidth
                @executions = executions
                @member = member
                @realtime = realtime
                @realtime_messages = realtime_messages
                @realtime_bandwidth = realtime_bandwidth
                @storage = storage
                @users = users
                @gb_hours = gb_hours
                @image_transformations = image_transformations
                @credits = credits
            end

            def self.from(map:)
                UsageBillingPlan.new(
                    bandwidth: map["bandwidth"].nil? ? nil : AdditionalResource.from(map: map["bandwidth"]),
                    executions: map["executions"].nil? ? nil : AdditionalResource.from(map: map["executions"]),
                    member: map["member"].nil? ? nil : AdditionalResource.from(map: map["member"]),
                    realtime: map["realtime"].nil? ? nil : AdditionalResource.from(map: map["realtime"]),
                    realtime_messages: map["realtimeMessages"].nil? ? nil : AdditionalResource.from(map: map["realtimeMessages"]),
                    realtime_bandwidth: map["realtimeBandwidth"].nil? ? nil : AdditionalResource.from(map: map["realtimeBandwidth"]),
                    storage: map["storage"].nil? ? nil : AdditionalResource.from(map: map["storage"]),
                    users: map["users"].nil? ? nil : AdditionalResource.from(map: map["users"]),
                    gb_hours: map["GBHours"].nil? ? nil : AdditionalResource.from(map: map["GBHours"]),
                    image_transformations: map["imageTransformations"].nil? ? nil : AdditionalResource.from(map: map["imageTransformations"]),
                    credits: map["credits"].nil? ? nil : AdditionalResource.from(map: map["credits"])
                )
            end

            def to_map
                {
                    "bandwidth": @bandwidth&.to_map,
                    "executions": @executions&.to_map,
                    "member": @member&.to_map,
                    "realtime": @realtime&.to_map,
                    "realtimeMessages": @realtime_messages&.to_map,
                    "realtimeBandwidth": @realtime_bandwidth&.to_map,
                    "storage": @storage&.to_map,
                    "users": @users&.to_map,
                    "GBHours": @gb_hours&.to_map,
                    "imageTransformations": @image_transformations&.to_map,
                    "credits": @credits&.to_map
                }
            end
        end
    end
end
