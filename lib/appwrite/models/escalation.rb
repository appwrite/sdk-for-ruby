# frozen_string_literal: true

module Appwrite
    module Models
        class Escalation
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :steps
            attr_reader :repeat

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                steps:,
                repeat:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @steps = steps
                @repeat = repeat
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "name" => "", "steps" => [], "repeat" => 0 }.merge(map)
                Escalation.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    steps: map["steps"].map { |it| EscalationStep.from(map: it) },
                    repeat: map["repeat"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "steps": @steps.map { |it| it.to_map },
                    "repeat": @repeat
                }
            end
        end
    end
end
