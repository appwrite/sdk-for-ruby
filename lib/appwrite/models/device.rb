# frozen_string_literal: true

module Appwrite
    module Models
        class Device
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :expire
            attr_reader :active_session_id
            attr_reader :sessions
            attr_reader :secret

            def initialize(
                id:,
                created_at:,
                updated_at:,
                expire:,
                active_session_id:,
                sessions:,
                secret:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @expire = expire
                @active_session_id = active_session_id
                @sessions = sessions
                @secret = secret
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "expire" => "", "activeSessionId" => "", "sessions" => [], "secret" => "" }.merge(map)
                Device.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    expire: map["expire"],
                    active_session_id: map["activeSessionId"],
                    sessions: map["sessions"].map { |it| Session.from(map: it) },
                    secret: map["secret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "expire": @expire,
                    "activeSessionId": @active_session_id,
                    "sessions": @sessions.map { |it| it.to_map },
                    "secret": @secret
                }
            end
        end
    end
end
