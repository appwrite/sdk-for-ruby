# frozen_string_literal: true

module Appwrite
    module Models
        class EscalationList
            attr_reader :total
            attr_reader :escalations

            def initialize(
                total:,
                escalations:
            )
                @total = total
                @escalations = escalations
            end

            def self.from(map:)
                map = { "total" => 0, "escalations" => [] }.merge(map)
                EscalationList.new(
                    total: map["total"],
                    escalations: map["escalations"].map { |it| Escalation.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "escalations": @escalations.map { |it| it.to_map }
                }
            end
        end
    end
end
