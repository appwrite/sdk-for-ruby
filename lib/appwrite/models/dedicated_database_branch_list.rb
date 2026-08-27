# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseBranchList
            attr_reader :total
            attr_reader :branches

            def initialize(
                total:,
                branches:
            )
                @total = total
                @branches = branches
            end

            def self.from(map:)
                DedicatedDatabaseBranchList.new(
                    total: map["total"],
                    branches: map["branches"].map { |it| DedicatedDatabaseBranch.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "branches": @branches.map { |it| it.to_map }
                }
            end
        end
    end
end
