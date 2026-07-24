#frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2OrganizationList
            attr_reader :total
            attr_reader :organizations

            def initialize(
                total:,
                organizations:
            )
                @total = total
                @organizations = organizations
            end

            def self.from(map:)
                Oauth2OrganizationList.new(
                    total: map["total"],
                    organizations: map["organizations"].map { |it| Oauth2Organization.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "organizations": @organizations.map { |it| it.to_map }
                }
            end
        end
    end
end
