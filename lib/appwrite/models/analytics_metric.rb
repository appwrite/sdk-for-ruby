# frozen_string_literal: true

module Appwrite
    module Models
        class AnalyticsMetric
            attr_reader :value
            attr_reader :date
            attr_reader :visitors
            attr_reader :sessions
            attr_reader :pageviews
            attr_reader :events
            attr_reader :users
            attr_reader :visits
            attr_reader :bounce_rate
            attr_reader :visit_duration
            attr_reader :views_per_visit
            attr_reader :scroll_depth
            attr_reader :engagement_time

            def initialize(
                value: nil,
                date: nil,
                visitors:,
                sessions:,
                pageviews: nil,
                events:,
                users: nil,
                visits: nil,
                bounce_rate: nil,
                visit_duration: nil,
                views_per_visit: nil,
                scroll_depth: nil,
                engagement_time: nil
            )
                @value = value
                @date = date
                @visitors = visitors
                @sessions = sessions
                @pageviews = pageviews
                @events = events
                @users = users
                @visits = visits
                @bounce_rate = bounce_rate
                @visit_duration = visit_duration
                @views_per_visit = views_per_visit
                @scroll_depth = scroll_depth
                @engagement_time = engagement_time
            end

            def self.from(map:)
                map = { "visitors" => 0, "sessions" => 0, "events" => 0 }.merge(map)
                AnalyticsMetric.new(
                    value: map["value"],
                    date: map["date"],
                    visitors: map["visitors"],
                    sessions: map["sessions"],
                    pageviews: map["pageviews"],
                    events: map["events"],
                    users: map["users"],
                    visits: map["visits"],
                    bounce_rate: map["bounceRate"],
                    visit_duration: map["visitDuration"],
                    views_per_visit: map["viewsPerVisit"],
                    scroll_depth: map["scrollDepth"],
                    engagement_time: map["engagementTime"]
                )
            end

            def to_map
                {
                    "value": @value,
                    "date": @date,
                    "visitors": @visitors,
                    "sessions": @sessions,
                    "pageviews": @pageviews,
                    "events": @events,
                    "users": @users,
                    "visits": @visits,
                    "bounceRate": @bounce_rate,
                    "visitDuration": @visit_duration,
                    "viewsPerVisit": @views_per_visit,
                    "scrollDepth": @scroll_depth,
                    "engagementTime": @engagement_time
                }
            end
        end
    end
end
