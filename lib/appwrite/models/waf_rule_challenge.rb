# frozen_string_literal: true

module Appwrite
    module Models
        class WafRuleChallenge
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :description
            attr_reader :team_id
            attr_reader :project_id
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :action
            attr_reader :priority
            attr_reader :enabled
            attr_reader :conditions
            attr_reader :config
            attr_reader :challenge_type
            attr_reader :difficulty
            attr_reader :ttl

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                description:,
                team_id:,
                project_id:,
                resource_type:,
                resource_id:,
                action:,
                priority:,
                enabled:,
                conditions:,
                config:,
                challenge_type:,
                difficulty:,
                ttl:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @description = description
                @team_id = team_id
                @project_id = project_id
                @resource_type = resource_type
                @resource_id = resource_id
                @action = validate_action(action)
                @priority = priority
                @enabled = enabled
                @conditions = conditions
                @config = config
                @challenge_type = challenge_type
                @difficulty = difficulty
                @ttl = ttl
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "name" => "", "description" => "", "teamId" => "", "projectId" => "", "resourceType" => "api", "resourceId" => "", "priority" => 0, "enabled" => true, "conditions" => [], "config" => {}, "challengeType" => "compute", "difficulty" => 3, "ttl" => 1800 }.merge(map)
                WafRuleChallenge.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    description: map["description"],
                    team_id: map["teamId"],
                    project_id: map["projectId"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    action: map["action"],
                    priority: map["priority"],
                    enabled: map["enabled"],
                    conditions: map["conditions"],
                    config: map["config"],
                    challenge_type: map["challengeType"],
                    difficulty: map["difficulty"],
                    ttl: map["ttl"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "description": @description,
                    "teamId": @team_id,
                    "projectId": @project_id,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "action": @action,
                    "priority": @priority,
                    "enabled": @enabled,
                    "conditions": @conditions,
                    "config": @config,
                    "challengeType": @challenge_type,
                    "difficulty": @difficulty,
                    "ttl": @ttl
                }
            end

            private

            def validate_action(action)
                valid_action = [
                    Appwrite::Enums::WafRuleAction::BYPASS,
                    Appwrite::Enums::WafRuleAction::DENY,
                    Appwrite::Enums::WafRuleAction::CHALLENGE,
                    Appwrite::Enums::WafRuleAction::RATELIMIT,
                    Appwrite::Enums::WafRuleAction::REDIRECT,
                ]

                unless valid_action.include?(action)
                    raise ArgumentError, "Invalid " + action + ". Must be one of: " + valid_action.join(', ')
                end

                action
            end
        end
    end
end
