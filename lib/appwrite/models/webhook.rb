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
            attr_reader :security
            attr_reader :http_user
            attr_reader :http_pass
            attr_reader :signature_key
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
                security:,
                http_user:,
                http_pass:,
                signature_key:,
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
                @security = security
                @http_user = http_user
                @http_pass = http_pass
                @signature_key = signature_key
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
                    security: map["security"],
                    http_user: map["httpUser"],
                    http_pass: map["httpPass"],
                    signature_key: map["signatureKey"],
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
                    "security": @security,
                    "httpUser": @http_user,
                    "httpPass": @http_pass,
                    "signatureKey": @signature_key,
                    "enabled": @enabled,
                    "logs": @logs,
                    "attempts": @attempts
                }
            end
        end
    end
end
