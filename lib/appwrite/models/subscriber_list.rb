#frozen_string_literal: true

module Appwrite
    module Models
        class SubscriberList
            attr_reader :total
            attr_reader :subscribers

            def initialize(
                total:,
                subscribers:
            )
                @total = total
                @subscribers = subscribers
            end

            def self.from(map:)
                SubscriberList.new(
                    total: map["total"],
                    subscribers: map["subscribers"].map { |it| Subscriber.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "subscribers": @subscribers.map { |it| it.to_map }
                }
            end
        end
    end
end
