#frozen_string_literal: true

module Appwrite
    module Models
        class Collection
            attr_reader :id
            attr_reader :permissions
            attr_reader :name
            attr_reader :date_created
            attr_reader :date_updated
            attr_reader :rules

            def initialize(
                id:,
                permissions:,
                name:,
                date_created:,
                date_updated:,
                rules:
            )
                @id = id
                @permissions = permissions
                @name = name
                @date_created = date_created
                @date_updated = date_updated
                @rules = rules
            end

            def self.from(map:)
                Collection.new(
                    id: map["$id"],
                    permissions: Permissions.from(map: map["$permissions"]),
                    name: map["name"],
                    date_created: map["dateCreated"],
                    date_updated: map["dateUpdated"],
                    rules: map["rules"].map { |it| Rule.from(map: it) }
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$permissions": @permissions.to_map,
                    "name": @name,
                    "dateCreated": @date_created,
                    "dateUpdated": @date_updated,
                    "rules": @rules.map { |it| it.to_map }
                }
            end
        end
    end
end