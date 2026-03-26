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
            attr_reader :mfa
            attr_reader :prefs
            attr_reader :targets
            attr_reader :accessed_at
            attr_reader :impersonator
            attr_reader :impersonator_user_id

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
                mfa:,
                prefs:,
                targets:,
                accessed_at:,
                impersonator: ,
                impersonator_user_id: 
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
                @mfa = mfa
                @prefs = prefs
                @targets = targets
                @accessed_at = accessed_at
                @impersonator = impersonator
                @impersonator_user_id = impersonator_user_id
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
                    mfa: map["mfa"],
                    prefs: Preferences.from(map: map["prefs"]),
                    targets: map["targets"].map { |it| Target.from(map: it) },
                    accessed_at: map["accessedAt"],
                    impersonator: map["impersonator"],
                    impersonator_user_id: map["impersonatorUserId"]
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
                    "mfa": @mfa,
                    "prefs": @prefs.to_map,
                    "targets": @targets.map { |it| it.to_map },
                    "accessedAt": @accessed_at,
                    "impersonator": @impersonator,
                    "impersonatorUserId": @impersonator_user_id
                }
            end
        end
    end
end
