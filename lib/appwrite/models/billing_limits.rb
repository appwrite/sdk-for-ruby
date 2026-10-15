# frozen_string_literal: true

module Appwrite
    module Models
        class BillingLimits
            attr_reader :bandwidth
            attr_reader :storage
            attr_reader :users
            attr_reader :executions
            attr_reader :gb_hours
            attr_reader :image_transformations
            attr_reader :auth_phone
            attr_reader :budget_limit

            def initialize(
                bandwidth: 0,
                storage: 0,
                users: 0,
                executions: 0,
                gb_hours: 0,
                image_transformations: 0,
                auth_phone: 0,
                budget_limit: 0
            )
                @bandwidth = bandwidth
                @storage = storage
                @users = users
                @executions = executions
                @gb_hours = gb_hours
                @image_transformations = image_transformations
                @auth_phone = auth_phone
                @budget_limit = budget_limit
            end

            def self.from(map:)
                BillingLimits.new(
                    bandwidth: map["bandwidth"],
                    storage: map["storage"],
                    users: map["users"],
                    executions: map["executions"],
                    gb_hours: map["GBHours"],
                    image_transformations: map["imageTransformations"],
                    auth_phone: map["authPhone"],
                    budget_limit: map["budgetLimit"]
                )
            end

            def to_map
                {
                    "bandwidth": @bandwidth,
                    "storage": @storage,
                    "users": @users,
                    "executions": @executions,
                    "GBHours": @gb_hours,
                    "imageTransformations": @image_transformations,
                    "authPhone": @auth_phone,
                    "budgetLimit": @budget_limit
                }
            end
        end
    end
end
