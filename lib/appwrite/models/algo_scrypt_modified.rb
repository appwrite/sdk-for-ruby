#frozen_string_literal: true

module Appwrite
    module Models
        class AlgoScryptModified
            attr_reader :type
            attr_reader :salt
            attr_reader :salt_separator
            attr_reader :signer_key

            def initialize(
                type:,
                salt:,
                salt_separator:,
                signer_key:
            )
                @type = type
                @salt = salt
                @salt_separator = salt_separator
                @signer_key = signer_key
            end

            def self.from(map:)
                AlgoScryptModified.new(
                    type: map["type"],
                    salt: map["salt"],
                    salt_separator: map["saltSeparator"],
                    signer_key: map["signerKey"]
                )
            end

            def to_map
                {
                    "type": @type,
                    "salt": @salt,
                    "saltSeparator": @salt_separator,
                    "signerKey": @signer_key
                }
            end
        end
    end
end