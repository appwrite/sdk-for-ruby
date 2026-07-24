#frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2ConsentToken
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :consent_id
            attr_reader :user_id
            attr_reader :app_id
            attr_reader :cimd_url
            attr_reader :scopes
            attr_reader :resources
            attr_reader :authorization_details
            attr_reader :expire

            def initialize(
                id:,
                created_at:,
                updated_at:,
                consent_id:,
                user_id:,
                app_id:,
                cimd_url:,
                scopes:,
                resources:,
                authorization_details:,
                expire:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @consent_id = consent_id
                @user_id = user_id
                @app_id = app_id
                @cimd_url = cimd_url
                @scopes = scopes
                @resources = resources
                @authorization_details = authorization_details
                @expire = expire
            end

            def self.from(map:)
                Oauth2ConsentToken.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    consent_id: map["consentId"],
                    user_id: map["userId"],
                    app_id: map["appId"],
                    cimd_url: map["cimdUrl"],
                    scopes: map["scopes"],
                    resources: map["resources"],
                    authorization_details: map["authorizationDetails"],
                    expire: map["expire"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "consentId": @consent_id,
                    "userId": @user_id,
                    "appId": @app_id,
                    "cimdUrl": @cimd_url,
                    "scopes": @scopes,
                    "resources": @resources,
                    "authorizationDetails": @authorization_details,
                    "expire": @expire
                }
            end
        end
    end
end
