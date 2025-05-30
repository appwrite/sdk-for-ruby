#frozen_string_literal: true

module Appwrite
    module Models
        class FrameworkList
            attr_reader :total
            attr_reader :frameworks

            def initialize(
                total:,
                frameworks:
            )
                @total = total
                @frameworks = frameworks
            end

            def self.from(map:)
                FrameworkList.new(
                    total: map["total"],
                    frameworks: map["frameworks"].map { |it| Framework.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "frameworks": @frameworks.map { |it| it.to_map }
                }
            end
        end
    end
end
