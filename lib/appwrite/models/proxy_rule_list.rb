#frozen_string_literal: true

module Appwrite
    module Models
        class ProxyRuleList
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
                ProxyRuleList.new(
                    total: map["total"],
                    rules: map["rules"].map { |it| ProxyRule.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "rules": @rules.map { |it| it.to_map }
                }
            end
        end
    end
end