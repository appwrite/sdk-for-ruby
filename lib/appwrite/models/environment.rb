# frozen_string_literal: true

module Appwrite
    module Models
        class Environment
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :project_id
            attr_reader :name

            def initialize(
                id:,
                created_at:,
                updated_at:,
                project_id:,
                name:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @project_id = project_id
                @name = name
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "projectId" => "", "name" => "" }.merge(map)
                Environment.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    project_id: map["projectId"],
                    name: map["name"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "projectId": @project_id,
                    "name": @name
                }
            end
        end
    end
end
