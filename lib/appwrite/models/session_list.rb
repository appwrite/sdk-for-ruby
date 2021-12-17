#frozen_string_literal: true

module Appwrite
    module Models
        class SessionList
            attr_reader :sum
            attr_reader :sessions

            def initialize(
                sum:,
                sessions:
            )
                @sum = sum
                @sessions = sessions
            end

            def self.from(map:)
                SessionList.new(
                    sum: map["sum"],
                    sessions: map["sessions"].map { |it| Session.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "sessions": @sessions.map { |it| it.to_map }
                }
            end
        end
    end
end