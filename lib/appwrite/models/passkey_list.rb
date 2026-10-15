# frozen_string_literal: true

module Appwrite
    module Models
        class PasskeyList
            attr_reader :total
            attr_reader :passkeys

            def initialize(
                total:,
                passkeys:
            )
                @total = total
                @passkeys = passkeys
            end

            def self.from(map:)
                map = { "total" => 0, "passkeys" => [] }.merge(map)
                PasskeyList.new(
                    total: map["total"],
                    passkeys: map["passkeys"].map { |it| Passkey.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "passkeys": @passkeys.map { |it| it.to_map }
                }
            end
        end
    end
end
