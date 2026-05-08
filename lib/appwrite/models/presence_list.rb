#frozen_string_literal: true

module Appwrite
    module Models
        class PresenceList
            attr_reader :total
            attr_reader :presences

            def initialize(
                total:,
                presences:
            )
                @total = total
                @presences = presences
            end

            def self.from(map:)
                PresenceList.new(
                    total: map["total"],
                    presences: map["presences"].map { |it| Presence.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "presences": @presences.map { |it| it.to_map }
                }
            end

            def convert_to(from_json)
                presences.map { |it| it.convert_to(from_json) }
            end
        end
    end
end
