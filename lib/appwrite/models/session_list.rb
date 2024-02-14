#frozen_string_literal: true

module Appwrite
    module Models
        class SessionList
            attr_reader :total
            attr_reader :sessions

            def initialize(
                total:,
                sessions:
            )
                @total = total
                @sessions = sessions
            end

            def self.from(map:)
                SessionList.new(
                    total: map["total"],
                    sessions: map["sessions"].map { |it| Session.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "sessions": @sessions.map { |it| it.to_map }
                }
            end
        end
    end
end
