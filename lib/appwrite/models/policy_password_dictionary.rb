# frozen_string_literal: true

module Appwrite
    module Models
        class PolicyPasswordDictionary
            attr_reader :id
            attr_reader :enabled
            attr_reader :deny_list

            def initialize(
                id:,
                enabled:,
                deny_list:
            )
                @id = id
                @enabled = enabled
                @deny_list = deny_list
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "denyList" => [] }.merge(map)
                PolicyPasswordDictionary.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    deny_list: map["denyList"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "denyList": @deny_list
                }
            end
        end
    end
end
