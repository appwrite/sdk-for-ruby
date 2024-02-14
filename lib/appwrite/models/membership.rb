#frozen_string_literal: true

module Appwrite
    module Models
        class Membership
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :user_id
            attr_reader :user_name
            attr_reader :user_email
            attr_reader :team_id
            attr_reader :team_name
            attr_reader :invited
            attr_reader :joined
            attr_reader :confirm
            attr_reader :roles

            def initialize(
                id:,
                created_at:,
                updated_at:,
                user_id:,
                user_name:,
                user_email:,
                team_id:,
                team_name:,
                invited:,
                joined:,
                confirm:,
                roles:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @user_id = user_id
                @user_name = user_name
                @user_email = user_email
                @team_id = team_id
                @team_name = team_name
                @invited = invited
                @joined = joined
                @confirm = confirm
                @roles = roles
            end

            def self.from(map:)
                Membership.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    user_id: map["userId"],
                    user_name: map["userName"],
                    user_email: map["userEmail"],
                    team_id: map["teamId"],
                    team_name: map["teamName"],
                    invited: map["invited"],
                    joined: map["joined"],
                    confirm: map["confirm"],
                    roles: map["roles"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "userId": @user_id,
                    "userName": @user_name,
                    "userEmail": @user_email,
                    "teamId": @team_id,
                    "teamName": @team_name,
                    "invited": @invited,
                    "joined": @joined,
                    "confirm": @confirm,
                    "roles": @roles
                }
            end
        end
    end
end
