#frozen_string_literal: true

module Appwrite
    module Models
        class InsightCTA
            attr_reader :label
            attr_reader :service
            attr_reader :method
            attr_reader :params

            def initialize(
                label:,
                service:,
                method:,
                params:
            )
                @label = label
                @service = service
                @method = method
                @params = params
            end

            def self.from(map:)
                InsightCTA.new(
                    label: map["label"],
                    service: map["service"],
                    method: map["method"],
                    params: map["params"]
                )
            end

            def to_map
                {
                    "label": @label,
                    "service": @service,
                    "method": @method,
                    "params": @params
                }
            end
        end
    end
end
