#frozen_string_literal: true

module Appwrite
    module Models
        class User
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :registration
            attr_reader :status
            attr_reader :password_update
            attr_reader :email
            attr_reader :phone
            attr_reader :email_verification
            attr_reader :phone_verification
            attr_reader :prefs

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                registration:,
                status:,
                password_update:,
                email:,
                phone:,
                email_verification:,
                phone_verification:,
                prefs:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @registration = registration
                @status = status
                @password_update = password_update
                @email = email
                @phone = phone
                @email_verification = email_verification
                @phone_verification = phone_verification
                @prefs = prefs
            end

            def self.from(map:)
                User.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    registration: map["registration"],
                    status: map["status"],
                    password_update: map["passwordUpdate"],
                    email: map["email"],
                    phone: map["phone"],
                    email_verification: map["emailVerification"],
                    phone_verification: map["phoneVerification"],
                    prefs: Preferences.from(map: map["prefs"])
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "registration": @registration,
                    "status": @status,
                    "passwordUpdate": @password_update,
                    "email": @email,
                    "phone": @phone,
                    "emailVerification": @email_verification,
                    "phoneVerification": @phone_verification,
                    "prefs": @prefs.to_map
                }
            end
        end
    end
end