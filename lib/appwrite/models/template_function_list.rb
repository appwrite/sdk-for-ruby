#frozen_string_literal: true

module Appwrite
    module Models
        class TemplateFunctionList
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
                TemplateFunctionList.new(
                    total: map["total"],
                    templates: map["templates"].map { |it| TemplateFunction.from(map: it) }
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
