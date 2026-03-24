#frozen_string_literal: true

module Appwrite
    module Models
        class WebhookList
            attr_reader :total
            attr_reader :webhooks

            def initialize(
                total:,
                webhooks:
            )
                @total = total
                @webhooks = webhooks
            end

            def self.from(map:)
                WebhookList.new(
                    total: map["total"],
                    webhooks: map["webhooks"].map { |it| Webhook.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "webhooks": @webhooks.map { |it| it.to_map }
                }
            end
        end
    end
end
