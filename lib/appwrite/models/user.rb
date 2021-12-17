#frozen_string_literal: true

module Appwrite
    module Models
        class User
            attr_reader :id
            attr_reader :name
            attr_reader :registration
            attr_reader :status
            attr_reader :password_update
            attr_reader :email
            attr_reader :email_verification
            attr_reader :prefs

            def initialize(
                id:,
                name:,
                registration:,
                status:,
                password_update:,
                email:,
                email_verification:,
                prefs:
            )
                @id = id
                @name = name
                @registration = registration
                @status = status
                @password_update = password_update
                @email = email
                @email_verification = email_verification
                @prefs = prefs
            end

            def self.from(map:)
                User.new(
                    id: map["$id"],
                    name: map["name"],
                    registration: map["registration"],
                    status: map["status"],
                    password_update: map["passwordUpdate"],
                    email: map["email"],
                    email_verification: map["emailVerification"],
                    prefs: Preferences.from(map: map["prefs"])
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "registration": @registration,
                    "status": @status,
                    "passwordUpdate": @password_update,
                    "email": @email,
                    "emailVerification": @email_verification,
                    "prefs": @prefs.to_map
                }
            end
        end
    end
end