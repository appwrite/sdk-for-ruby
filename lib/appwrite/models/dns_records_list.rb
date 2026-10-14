# frozen_string_literal: true

module Appwrite
    module Models
        class DnsRecordsList
            attr_reader :total
            attr_reader :dns_records

            def initialize(
                total:,
                dns_records:
            )
                @total = total
                @dns_records = dns_records
            end

            def self.from(map:)
                map = { "total" => 0, "dnsRecords" => [] }.merge(map)
                DnsRecordsList.new(
                    total: map["total"],
                    dns_records: map["dnsRecords"].map { |it| DnsRecord.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "dnsRecords": @dns_records.map { |it| it.to_map }
                }
            end
        end
    end
end
