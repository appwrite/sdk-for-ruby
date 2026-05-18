#frozen_string_literal: true

module Appwrite
    module Models
        class UsageEvent
            attr_reader :metric
            attr_reader :value
            attr_reader :time
            attr_reader :xpath
            attr_reader :method
            attr_reader :status
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :country_code
            attr_reader :user_agent

            def initialize(
                metric:,
                value:,
                time:,
                xpath:,
                method:,
                status:,
                resource_type:,
                resource_id:,
                country_code:,
                user_agent:
            )
                @metric = metric
                @value = value
                @time = time
                @xpath = xpath
                @method = method
                @status = status
                @resource_type = resource_type
                @resource_id = resource_id
                @country_code = country_code
                @user_agent = user_agent
            end

            def self.from(map:)
                UsageEvent.new(
                    metric: map["metric"],
                    value: map["value"],
                    time: map["time"],
                    xpath: map["path"],
                    method: map["method"],
                    status: map["status"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    country_code: map["countryCode"],
                    user_agent: map["userAgent"]
                )
            end

            def to_map
                {
                    "metric": @metric,
                    "value": @value,
                    "time": @time,
                    "path": @xpath,
                    "method": @method,
                    "status": @status,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "countryCode": @country_code,
                    "userAgent": @user_agent
                }
            end
        end
    end
end
