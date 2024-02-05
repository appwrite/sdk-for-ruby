#frozen_string_literal: true

module Appwrite
    module Models
        class MessageList
            attr_reader :total
            attr_reader :messages

            def initialize(
                total:,
                messages:
            )
                @total = total
                @messages = messages
            end

            def self.from(map:)
                MessageList.new(
                    total: map["total"],
                    messages: map["messages"].map { |it| Message.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "messages": @messages.map { |it| it.to_map }
                }
            end
        end
    end
end