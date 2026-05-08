#frozen_string_literal: true

module Appwrite
    module Models
        class EmailTemplateList
            attr_reader :total
            attr_reader :templates

            def initialize(
                total:,
                templates:
            )
                @total = total
                @templates = templates
            end

            def self.from(map:)
                EmailTemplateList.new(
                    total: map["total"],
                    templates: map["templates"].map { |it| EmailTemplate.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "templates": @templates.map { |it| it.to_map }
                }
            end
        end
    end
end
