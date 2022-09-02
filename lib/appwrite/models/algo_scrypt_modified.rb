#frozen_string_literal: true

module Appwrite
    module Models
        class AlgoScryptModified
            attr_reader :salt
            attr_reader :salt_separator
            attr_reader :signer_key

            def initialize(
                salt:,
                salt_separator:,
                signer_key:
            )
                @salt = salt
                @salt_separator = salt_separator
                @signer_key = signer_key
            end

            def self.from(map:)
                AlgoScryptModified.new(
                    salt: map["salt"],
                    salt_separator: map["saltSeparator"],
                    signer_key: map["signerKey"]
                )
            end

            def to_map
                {
                    "salt": @salt,
                    "saltSeparator": @salt_separator,
                    "signerKey": @signer_key
                }
            end
        end
    end
end