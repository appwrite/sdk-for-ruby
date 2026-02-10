#frozen_string_literal: true

module Appwrite
    module Models
        class EstimationDeleteOrganization
            attr_reader :unpaid_invoices

            def initialize(
                unpaid_invoices:
            )
                @unpaid_invoices = unpaid_invoices
            end

            def self.from(map:)
                EstimationDeleteOrganization.new(
                    unpaid_invoices: map["unpaidInvoices"].map { |it| Invoice.from(map: it) }
                )
            end

            def to_map
                {
                    "unpaidInvoices": @unpaid_invoices.map { |it| it.to_map }
                }
            end
        end
    end
end
