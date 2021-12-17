#frozen_string_literal: true

module Appwrite
    module Models
        class Team
            attr_reader :id
            attr_reader :name
            attr_reader :date_created
            attr_reader :sum

            def initialize(
                id:,
                name:,
                date_created:,
                sum:
            )
                @id = id
                @name = name
                @date_created = date_created
                @sum = sum
            end

            def self.from(map:)
                Team.new(
                    id: map["$id"],
                    name: map["name"],
                    date_created: map["dateCreated"],
                    sum: map["sum"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "dateCreated": @date_created,
                    "sum": @sum
                }
            end
        end
    end
end