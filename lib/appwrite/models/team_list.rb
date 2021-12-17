#frozen_string_literal: true

module Appwrite
    module Models
        class TeamList
            attr_reader :sum
            attr_reader :teams

            def initialize(
                sum:,
                teams:
            )
                @sum = sum
                @teams = teams
            end

            def self.from(map:)
                TeamList.new(
                    sum: map["sum"],
                    teams: map["teams"].map { |it| Team.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "teams": @teams.map { |it| it.to_map }
                }
            end
        end
    end
end