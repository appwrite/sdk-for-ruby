# frozen_string_literal: true

module Appwrite
    module Models
        class WafRuleList
            attr_reader :total
            attr_reader :rules

            def initialize(
                total:,
                rules:
            )
                @total = total
                @rules = rules
            end

            def self.from(map:)
                map = { "total" => 0, "rules" => [] }.merge(map)
                WafRuleList.new(
                    total: map["total"],
                    rules: map["rules"]
                )
            end

            def to_map
                {
                    "total": @total,
                    "rules": @rules
                }
            end
        end
    end
end
