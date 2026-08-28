# frozen_string_literal: true

module Appwrite
    module Models
        class AppInstallation
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :app_id
            attr_reader :team_id
            attr_reader :scopes
            attr_reader :authorization_details
            attr_reader :created_by_id
            attr_reader :created_by_name
            attr_reader :last_accessed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                app_id:,
                team_id:,
                scopes:,
                authorization_details:,
                created_by_id:,
                created_by_name:,
                last_accessed_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @app_id = app_id
                @team_id = team_id
                @scopes = scopes
                @authorization_details = authorization_details
                @created_by_id = created_by_id
                @created_by_name = created_by_name
                @last_accessed_at = last_accessed_at
            end

            def self.from(map:)
                AppInstallation.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    app_id: map["appId"],
                    team_id: map["teamId"],
                    scopes: map["scopes"],
                    authorization_details: map["authorizationDetails"],
                    created_by_id: map["createdById"],
                    created_by_name: map["createdByName"],
                    last_accessed_at: map["lastAccessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "appId": @app_id,
                    "teamId": @team_id,
                    "scopes": @scopes,
                    "authorizationDetails": @authorization_details,
                    "createdById": @created_by_id,
                    "createdByName": @created_by_name,
                    "lastAccessedAt": @last_accessed_at
                }
            end
        end
    end
end
