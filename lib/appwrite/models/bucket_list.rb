#frozen_string_literal: true

module Appwrite
    module Models
        class BucketList
            attr_reader :total
            attr_reader :buckets

            def initialize(
                total:,
                buckets:
            )
                @total = total
                @buckets = buckets
            end

            def self.from(map:)
                BucketList.new(
                    total: map["total"],
                    buckets: map["buckets"].map { |it| Bucket.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "buckets": @buckets.map { |it| it.to_map }
                }
            end
        end
    end
end
