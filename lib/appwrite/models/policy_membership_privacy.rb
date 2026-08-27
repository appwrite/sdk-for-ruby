# frozen_string_literal: true

module Appwrite
    module Models
        class PolicyMembershipPrivacy
            attr_reader :id
            attr_reader :user_id
            attr_reader :user_email
            attr_reader :user_phone
            attr_reader :user_name
            attr_reader :user_mfa
            attr_reader :user_accessed_at

            def initialize(
                id:,
                user_id:,
                user_email:,
                user_phone:,
                user_name:,
                user_mfa:,
                user_accessed_at:
            )
                @id = id
                @user_id = user_id
                @user_email = user_email
                @user_phone = user_phone
                @user_name = user_name
                @user_mfa = user_mfa
                @user_accessed_at = user_accessed_at
            end

            def self.from(map:)
                PolicyMembershipPrivacy.new(
                    id: map["$id"],
                    user_id: map["userId"],
                    user_email: map["userEmail"],
                    user_phone: map["userPhone"],
                    user_name: map["userName"],
                    user_mfa: map["userMFA"],
                    user_accessed_at: map["userAccessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "userId": @user_id,
                    "userEmail": @user_email,
                    "userPhone": @user_phone,
                    "userName": @user_name,
                    "userMFA": @user_mfa,
                    "userAccessedAt": @user_accessed_at
                }
            end
        end
    end
end
