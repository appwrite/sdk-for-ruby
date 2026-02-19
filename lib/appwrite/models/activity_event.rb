#frozen_string_literal: true

module Appwrite
    module Models
        class ActivityEvent
            attr_reader :id
            attr_reader :user_type
            attr_reader :user_id
            attr_reader :user_email
            attr_reader :user_name
            attr_reader :resource_parent
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :resource
            attr_reader :event
            attr_reader :user_agent
            attr_reader :ip
            attr_reader :mode
            attr_reader :country
            attr_reader :time
            attr_reader :project_id
            attr_reader :team_id
            attr_reader :hostname
            attr_reader :os_code
            attr_reader :os_name
            attr_reader :os_version
            attr_reader :client_type
            attr_reader :client_code
            attr_reader :client_name
            attr_reader :client_version
            attr_reader :client_engine
            attr_reader :client_engine_version
            attr_reader :device_name
            attr_reader :device_brand
            attr_reader :device_model
            attr_reader :country_code
            attr_reader :country_name

            def initialize(
                id:,
                user_type:,
                user_id:,
                user_email:,
                user_name:,
                resource_parent:,
                resource_type:,
                resource_id:,
                resource:,
                event:,
                user_agent:,
                ip:,
                mode:,
                country:,
                time:,
                project_id:,
                team_id:,
                hostname:,
                os_code:,
                os_name:,
                os_version:,
                client_type:,
                client_code:,
                client_name:,
                client_version:,
                client_engine:,
                client_engine_version:,
                device_name:,
                device_brand:,
                device_model:,
                country_code:,
                country_name:
            )
                @id = id
                @user_type = user_type
                @user_id = user_id
                @user_email = user_email
                @user_name = user_name
                @resource_parent = resource_parent
                @resource_type = resource_type
                @resource_id = resource_id
                @resource = resource
                @event = event
                @user_agent = user_agent
                @ip = ip
                @mode = mode
                @country = country
                @time = time
                @project_id = project_id
                @team_id = team_id
                @hostname = hostname
                @os_code = os_code
                @os_name = os_name
                @os_version = os_version
                @client_type = client_type
                @client_code = client_code
                @client_name = client_name
                @client_version = client_version
                @client_engine = client_engine
                @client_engine_version = client_engine_version
                @device_name = device_name
                @device_brand = device_brand
                @device_model = device_model
                @country_code = country_code
                @country_name = country_name
            end

            def self.from(map:)
                ActivityEvent.new(
                    id: map["$id"],
                    user_type: map["userType"],
                    user_id: map["userId"],
                    user_email: map["userEmail"],
                    user_name: map["userName"],
                    resource_parent: map["resourceParent"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    resource: map["resource"],
                    event: map["event"],
                    user_agent: map["userAgent"],
                    ip: map["ip"],
                    mode: map["mode"],
                    country: map["country"],
                    time: map["time"],
                    project_id: map["projectId"],
                    team_id: map["teamId"],
                    hostname: map["hostname"],
                    os_code: map["osCode"],
                    os_name: map["osName"],
                    os_version: map["osVersion"],
                    client_type: map["clientType"],
                    client_code: map["clientCode"],
                    client_name: map["clientName"],
                    client_version: map["clientVersion"],
                    client_engine: map["clientEngine"],
                    client_engine_version: map["clientEngineVersion"],
                    device_name: map["deviceName"],
                    device_brand: map["deviceBrand"],
                    device_model: map["deviceModel"],
                    country_code: map["countryCode"],
                    country_name: map["countryName"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "userType": @user_type,
                    "userId": @user_id,
                    "userEmail": @user_email,
                    "userName": @user_name,
                    "resourceParent": @resource_parent,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "resource": @resource,
                    "event": @event,
                    "userAgent": @user_agent,
                    "ip": @ip,
                    "mode": @mode,
                    "country": @country,
                    "time": @time,
                    "projectId": @project_id,
                    "teamId": @team_id,
                    "hostname": @hostname,
                    "osCode": @os_code,
                    "osName": @os_name,
                    "osVersion": @os_version,
                    "clientType": @client_type,
                    "clientCode": @client_code,
                    "clientName": @client_name,
                    "clientVersion": @client_version,
                    "clientEngine": @client_engine,
                    "clientEngineVersion": @client_engine_version,
                    "deviceName": @device_name,
                    "deviceBrand": @device_brand,
                    "deviceModel": @device_model,
                    "countryCode": @country_code,
                    "countryName": @country_name
                }
            end
        end
    end
end
