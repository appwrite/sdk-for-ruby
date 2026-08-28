# frozen_string_literal: true

module Appwrite
    module Models
        class ActivityEvent
            attr_reader :id
            attr_reader :actor_type
            attr_reader :actor_id
            attr_reader :actor_email
            attr_reader :actor_name
            attr_reader :resource_parent
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :resource
            attr_reader :event
            attr_reader :user_agent
            attr_reader :ip
            attr_reader :mode
            attr_reader :country
            attr_reader :continent_code
            attr_reader :city
            attr_reader :subdivisions
            attr_reader :isp
            attr_reader :autonomous_system_number
            attr_reader :autonomous_system_organization
            attr_reader :connection_type
            attr_reader :connection_usage_type
            attr_reader :connection_organization
            attr_reader :time
            attr_reader :project_id
            attr_reader :team_id
            attr_reader :hostname
            attr_reader :sdk
            attr_reader :sdk_version

            def initialize(
                id:,
                actor_type:,
                actor_id:,
                actor_email:,
                actor_name:,
                resource_parent:,
                resource_type:,
                resource_id:,
                resource:,
                event:,
                user_agent:,
                ip:,
                mode:,
                country:,
                continent_code:,
                city:,
                subdivisions:,
                isp:,
                autonomous_system_number:,
                autonomous_system_organization:,
                connection_type:,
                connection_usage_type:,
                connection_organization:,
                time:,
                project_id:,
                team_id:,
                hostname:,
                sdk:,
                sdk_version:
            )
                @id = id
                @actor_type = actor_type
                @actor_id = actor_id
                @actor_email = actor_email
                @actor_name = actor_name
                @resource_parent = resource_parent
                @resource_type = resource_type
                @resource_id = resource_id
                @resource = resource
                @event = event
                @user_agent = user_agent
                @ip = ip
                @mode = mode
                @country = country
                @continent_code = continent_code
                @city = city
                @subdivisions = subdivisions
                @isp = isp
                @autonomous_system_number = autonomous_system_number
                @autonomous_system_organization = autonomous_system_organization
                @connection_type = connection_type
                @connection_usage_type = connection_usage_type
                @connection_organization = connection_organization
                @time = time
                @project_id = project_id
                @team_id = team_id
                @hostname = hostname
                @sdk = sdk
                @sdk_version = sdk_version
            end

            def self.from(map:)
                ActivityEvent.new(
                    id: map["$id"],
                    actor_type: map["actorType"],
                    actor_id: map["actorId"],
                    actor_email: map["actorEmail"],
                    actor_name: map["actorName"],
                    resource_parent: map["resourceParent"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    resource: map["resource"],
                    event: map["event"],
                    user_agent: map["userAgent"],
                    ip: map["ip"],
                    mode: map["mode"],
                    country: map["country"],
                    continent_code: map["continentCode"],
                    city: map["city"],
                    subdivisions: map["subdivisions"],
                    isp: map["isp"],
                    autonomous_system_number: map["autonomousSystemNumber"],
                    autonomous_system_organization: map["autonomousSystemOrganization"],
                    connection_type: map["connectionType"],
                    connection_usage_type: map["connectionUsageType"],
                    connection_organization: map["connectionOrganization"],
                    time: map["time"],
                    project_id: map["projectId"],
                    team_id: map["teamId"],
                    hostname: map["hostname"],
                    sdk: map["sdk"],
                    sdk_version: map["sdkVersion"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "actorType": @actor_type,
                    "actorId": @actor_id,
                    "actorEmail": @actor_email,
                    "actorName": @actor_name,
                    "resourceParent": @resource_parent,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "resource": @resource,
                    "event": @event,
                    "userAgent": @user_agent,
                    "ip": @ip,
                    "mode": @mode,
                    "country": @country,
                    "continentCode": @continent_code,
                    "city": @city,
                    "subdivisions": @subdivisions,
                    "isp": @isp,
                    "autonomousSystemNumber": @autonomous_system_number,
                    "autonomousSystemOrganization": @autonomous_system_organization,
                    "connectionType": @connection_type,
                    "connectionUsageType": @connection_usage_type,
                    "connectionOrganization": @connection_organization,
                    "time": @time,
                    "projectId": @project_id,
                    "teamId": @team_id,
                    "hostname": @hostname,
                    "sdk": @sdk,
                    "sdkVersion": @sdk_version
                }
            end
        end
    end
end
