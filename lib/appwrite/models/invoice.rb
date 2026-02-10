#frozen_string_literal: true

module Appwrite
    module Models
        class Invoice
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :team_id
            attr_reader :aggregation_id
            attr_reader :plan
            attr_reader :usage
            attr_reader :amount
            attr_reader :tax
            attr_reader :tax_amount
            attr_reader :vat
            attr_reader :vat_amount
            attr_reader :gross_amount
            attr_reader :credits_used
            attr_reader :currency
            attr_reader :client_secret
            attr_reader :status
            attr_reader :last_error
            attr_reader :due_at
            attr_reader :from
            attr_reader :to

            def initialize(
                id:,
                created_at:,
                updated_at:,
                permissions:,
                team_id:,
                aggregation_id:,
                plan:,
                usage:,
                amount:,
                tax:,
                tax_amount:,
                vat:,
                vat_amount:,
                gross_amount:,
                credits_used:,
                currency:,
                client_secret:,
                status:,
                last_error:,
                due_at:,
                from:,
                to:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @team_id = team_id
                @aggregation_id = aggregation_id
                @plan = plan
                @usage = usage
                @amount = amount
                @tax = tax
                @tax_amount = tax_amount
                @vat = vat
                @vat_amount = vat_amount
                @gross_amount = gross_amount
                @credits_used = credits_used
                @currency = currency
                @client_secret = client_secret
                @status = status
                @last_error = last_error
                @due_at = due_at
                @from = from
                @to = to
            end

            def self.from(map:)
                Invoice.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    team_id: map["teamId"],
                    aggregation_id: map["aggregationId"],
                    plan: map["plan"],
                    usage: map["usage"].map { |it| UsageResources.from(map: it) },
                    amount: map["amount"],
                    tax: map["tax"],
                    tax_amount: map["taxAmount"],
                    vat: map["vat"],
                    vat_amount: map["vatAmount"],
                    gross_amount: map["grossAmount"],
                    credits_used: map["creditsUsed"],
                    currency: map["currency"],
                    client_secret: map["clientSecret"],
                    status: map["status"],
                    last_error: map["lastError"],
                    due_at: map["dueAt"],
                    from: map["from"],
                    to: map["to"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "teamId": @team_id,
                    "aggregationId": @aggregation_id,
                    "plan": @plan,
                    "usage": @usage.map { |it| it.to_map },
                    "amount": @amount,
                    "tax": @tax,
                    "taxAmount": @tax_amount,
                    "vat": @vat,
                    "vatAmount": @vat_amount,
                    "grossAmount": @gross_amount,
                    "creditsUsed": @credits_used,
                    "currency": @currency,
                    "clientSecret": @client_secret,
                    "status": @status,
                    "lastError": @last_error,
                    "dueAt": @due_at,
                    "from": @from,
                    "to": @to
                }
            end
        end
    end
end
