#frozen_string_literal: true

module Appwrite
    module Models
        class ProxyInvalidation
            attr_reader :domain
            attr_reader :type
            attr_reader :reference
            attr_reader :status

            def initialize(
                domain:,
                type:,
                reference:,
                status:
            )
                @domain = domain
                @type = type
                @reference = reference
                @status = status
            end

            def self.from(map:)
                ProxyInvalidation.new(
                    domain: map["domain"],
                    type: map["type"],
                    reference: map["reference"],
                    status: map["status"]
                )
            end

            def to_map
                {
                    "domain": @domain,
                    "type": @type,
                    "reference": @reference,
                    "status": @status
                }
            end
        end
    end
end
