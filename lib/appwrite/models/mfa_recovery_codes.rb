#frozen_string_literal: true

module Appwrite
    module Models
        class MfaRecoveryCodes
            attr_reader :recovery_codes

            def initialize(
                recovery_codes:
            )
                @recovery_codes = recovery_codes
            end

            def self.from(map:)
                MfaRecoveryCodes.new(
                    recovery_codes: map["recoveryCodes"]
                )
            end

            def to_map
                {
                    "recoveryCodes": @recovery_codes
                }
            end
        end
    end
end
