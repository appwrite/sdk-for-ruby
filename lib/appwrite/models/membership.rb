#frozen_string_literal: true

module Appwrite
    module Models
        class Membership
            attr_reader :id
            attr_reader :user_id
            attr_reader :team_id
            attr_reader :name
            attr_reader :email
            attr_reader :invited
            attr_reader :joined
            attr_reader :confirm
            attr_reader :roles

            def initialize(
                id:,
                user_id:,
                team_id:,
                name:,
                email:,
                invited:,
                joined:,
                confirm:,
                roles:
            )
                @id = id
                @user_id = user_id
                @team_id = team_id
                @name = name
                @email = email
                @invited = invited
                @joined = joined
                @confirm = confirm
                @roles = roles
            end

            def self.from(map:)
                Membership.new(
                    id: map["$id"],
                    user_id: map["userId"],
                    team_id: map["teamId"],
                    name: map["name"],
                    email: map["email"],
                    invited: map["invited"],
                    joined: map["joined"],
                    confirm: map["confirm"],
                    roles: map["roles"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "userId": @user_id,
                    "teamId": @team_id,
                    "name": @name,
                    "email": @email,
                    "invited": @invited,
                    "joined": @joined,
                    "confirm": @confirm,
                    "roles": @roles
                }
            end
        end
    end
end