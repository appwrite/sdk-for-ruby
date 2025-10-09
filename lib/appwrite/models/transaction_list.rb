#frozen_string_literal: true

module Appwrite
    module Models
        class TransactionList
            attr_reader :total
            attr_reader :transactions

            def initialize(
                total:,
                transactions:
            )
                @total = total
                @transactions = transactions
            end

            def self.from(map:)
                TransactionList.new(
                    total: map["total"],
                    transactions: map["transactions"].map { |it| Transaction.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "transactions": @transactions.map { |it| it.to_map }
                }
            end
        end
    end
end
