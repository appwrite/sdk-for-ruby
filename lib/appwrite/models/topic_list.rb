#frozen_string_literal: true

module Appwrite
    module Models
        class TopicList
            attr_reader :total
            attr_reader :topics

            def initialize(
                total:,
                topics:
            )
                @total = total
                @topics = topics
            end

            def self.from(map:)
                TopicList.new(
                    total: map["total"],
                    topics: map["topics"].map { |it| Topic.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "topics": @topics.map { |it| it.to_map }
                }
            end
        end
    end
end
