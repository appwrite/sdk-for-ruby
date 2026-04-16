#frozen_string_literal: true

module Appwrite
    module Models
        class Webhook
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :url
            attr_reader :events
            attr_reader :tls
            attr_reader :auth_username
            attr_reader :auth_password
            attr_reader :secret
            attr_reader :enabled
            attr_reader :logs
            attr_reader :attempts

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                url:,
                events:,
                tls:,
                auth_username:,
                auth_password:,
                secret:,
                enabled:,
                logs:,
                attempts:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @url = url
                @events = events
                @tls = tls
                @auth_username = auth_username
                @auth_password = auth_password
                @secret = secret
                @enabled = enabled
                @logs = logs
                @attempts = attempts
            end

            def self.from(map:)
                Webhook.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    url: map["url"],
                    events: map["events"],
                    tls: map["tls"],
                    auth_username: map["authUsername"],
                    auth_password: map["authPassword"],
                    secret: map["secret"],
                    enabled: map["enabled"],
                    logs: map["logs"],
                    attempts: map["attempts"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "url": @url,
                    "events": @events,
                    "tls": @tls,
                    "authUsername": @auth_username,
                    "authPassword": @auth_password,
                    "secret": @secret,
                    "enabled": @enabled,
                    "logs": @logs,
                    "attempts": @attempts
                }
            end
        end
    end
end
