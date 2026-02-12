#frozen_string_literal: true

module Appwrite
    module Models
        class BackupPolicyList
            attr_reader :total
            attr_reader :policies

            def initialize(
                total:,
                policies:
            )
                @total = total
                @policies = policies
            end

            def self.from(map:)
                BackupPolicyList.new(
                    total: map["total"],
                    policies: map["policies"].map { |it| BackupPolicy.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "policies": @policies.map { |it| it.to_map }
                }
            end
        end
    end
end
