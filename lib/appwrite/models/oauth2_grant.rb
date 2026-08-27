# frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2Grant
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :user_id
            attr_reader :app_id
            attr_reader :scopes
            attr_reader :resources
            attr_reader :authorization_details
            attr_reader :prompt
            attr_reader :redirect_uri
            attr_reader :auth_time
            attr_reader :expire

            def initialize(
                id:,
                created_at:,
                updated_at:,
                user_id:,
                app_id:,
                scopes:,
                resources:,
                authorization_details:,
                prompt:,
                redirect_uri:,
                auth_time:,
                expire:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @user_id = user_id
                @app_id = app_id
                @scopes = scopes
                @resources = resources
                @authorization_details = authorization_details
                @prompt = prompt
                @redirect_uri = redirect_uri
                @auth_time = auth_time
                @expire = expire
            end

            def self.from(map:)
                Oauth2Grant.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    user_id: map["userId"],
                    app_id: map["appId"],
                    scopes: map["scopes"],
                    resources: map["resources"],
                    authorization_details: map["authorizationDetails"],
                    prompt: map["prompt"],
                    redirect_uri: map["redirectUri"],
                    auth_time: map["authTime"],
                    expire: map["expire"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "userId": @user_id,
                    "appId": @app_id,
                    "scopes": @scopes,
                    "resources": @resources,
                    "authorizationDetails": @authorization_details,
                    "prompt": @prompt,
                    "redirectUri": @redirect_uri,
                    "authTime": @auth_time,
                    "expire": @expire
                }
            end
        end
    end
end
