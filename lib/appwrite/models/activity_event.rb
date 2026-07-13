#frozen_string_literal: true

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
            attr_reader :time
            attr_reader :project_id
            attr_reader :team_id
            attr_reader :hostname

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
                time:,
                project_id:,
                team_id:,
                hostname:
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
                @time = time
                @project_id = project_id
                @team_id = team_id
                @hostname = hostname
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
                    time: map["time"],
                    project_id: map["projectId"],
                    team_id: map["teamId"],
                    hostname: map["hostname"]
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
                    "time": @time,
                    "projectId": @project_id,
                    "teamId": @team_id,
                    "hostname": @hostname
                }
            end
        end
    end
end
