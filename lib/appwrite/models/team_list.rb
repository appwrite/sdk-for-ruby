#frozen_string_literal: true

module Appwrite
    module Models
        class TeamList
            attr_reader :total
            attr_reader :teams

            def initialize(
                total:,
                teams:
            )
                @total = total
                @teams = teams
            end

            def self.from(map:)
                TeamList.new(
                    total: map["total"],
                    teams: map["teams"].map { |it| Team.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "teams": @teams.map { |it| it.to_map }
                }
            end
        end
    end
end
