#frozen_string_literal: true

module Appwrite
    module Models
        class SiteList
            attr_reader :total
            attr_reader :sites

            def initialize(
                total:,
                sites:
            )
                @total = total
                @sites = sites
            end

            def self.from(map:)
                SiteList.new(
                    total: map["total"],
                    sites: map["sites"].map { |it| Site.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "sites": @sites.map { |it| it.to_map }
                }
            end
        end
    end
end
