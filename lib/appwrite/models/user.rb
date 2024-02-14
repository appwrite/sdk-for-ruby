#frozen_string_literal: true

module Appwrite
    module Models
        class User
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :password
            attr_reader :hash
            attr_reader :hash_options
            attr_reader :registration
            attr_reader :status
            attr_reader :labels
            attr_reader :password_update
            attr_reader :email
            attr_reader :phone
            attr_reader :email_verification
            attr_reader :phone_verification
            attr_reader :prefs
            attr_reader :accessed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                password: ,
                hash: ,
                hash_options: ,
                registration:,
                status:,
                labels:,
                password_update:,
                email:,
                phone:,
                email_verification:,
                phone_verification:,
                prefs:,
                accessed_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @password = password
                @hash = hash
                @hash_options = hash_options
                @registration = registration
                @status = status
                @labels = labels
                @password_update = password_update
                @email = email
                @phone = phone
                @email_verification = email_verification
                @phone_verification = phone_verification
                @prefs = prefs
                @accessed_at = accessed_at
            end

            def self.from(map:)
                User.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    password: map["password"],
                    hash: map["hash"],
                    hash_options: map["hashOptions"],
                    registration: map["registration"],
                    status: map["status"],
                    labels: map["labels"],
                    password_update: map["passwordUpdate"],
                    email: map["email"],
                    phone: map["phone"],
                    email_verification: map["emailVerification"],
                    phone_verification: map["phoneVerification"],
                    prefs: Preferences.from(map: map["prefs"]),
                    accessed_at: map["accessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "password": @password,
                    "hash": @hash,
                    "hashOptions": @hash_options,
                    "registration": @registration,
                    "status": @status,
                    "labels": @labels,
                    "passwordUpdate": @password_update,
                    "email": @email,
                    "phone": @phone,
                    "emailVerification": @email_verification,
                    "phoneVerification": @phone_verification,
                    "prefs": @prefs.to_map,
                    "accessedAt": @accessed_at
                }
            end
        end
    end
end
