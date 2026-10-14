# frozen_string_literal: true

module Appwrite
    module Models
        class Domain
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :domain
            attr_reader :registrar
            attr_reader :nameservers
            attr_reader :expire
            attr_reader :renewal
            attr_reader :auto_renewal
            attr_reader :renewal_price
            attr_reader :transfer_status
            attr_reader :team_id
            attr_reader :dns_records

            def initialize(
                id:,
                created_at:,
                updated_at:,
                domain:,
                registrar:,
                nameservers:,
                expire:,
                renewal:,
                auto_renewal:,
                renewal_price:,
                transfer_status:,
                team_id:,
                dns_records:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @domain = domain
                @registrar = registrar
                @nameservers = nameservers
                @expire = expire
                @renewal = renewal
                @auto_renewal = auto_renewal
                @renewal_price = renewal_price
                @transfer_status = transfer_status.nil? ? transfer_status : validate_transfer_status(transfer_status)
                @team_id = team_id
                @dns_records = dns_records
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "domain" => "", "registrar" => "", "nameservers" => "", "expire" => "", "renewal" => "", "autoRenewal" => false, "renewalPrice" => 0, "teamId" => "", "dnsRecords" => [] }.merge(map)
                Domain.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    domain: map["domain"],
                    registrar: map["registrar"],
                    nameservers: map["nameservers"],
                    expire: map["expire"],
                    renewal: map["renewal"],
                    auto_renewal: map["autoRenewal"],
                    renewal_price: map["renewalPrice"],
                    transfer_status: map["transferStatus"],
                    team_id: map["teamId"],
                    dns_records: map["dnsRecords"].map { |it| DnsRecord.from(map: it) }
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "domain": @domain,
                    "registrar": @registrar,
                    "nameservers": @nameservers,
                    "expire": @expire,
                    "renewal": @renewal,
                    "autoRenewal": @auto_renewal,
                    "renewalPrice": @renewal_price,
                    "transferStatus": @transfer_status,
                    "teamId": @team_id,
                    "dnsRecords": @dns_records.map { |it| it.to_map }
                }
            end

            private

            def validate_transfer_status(transfer_status)
                valid_transfer_status = [
                    Appwrite::Enums::DomainTransferStatusEnum::TRANSFERRABLE,
                    Appwrite::Enums::DomainTransferStatusEnum::NOT_TRANSFERRABLE,
                    Appwrite::Enums::DomainTransferStatusEnum::PENDING_OWNER,
                    Appwrite::Enums::DomainTransferStatusEnum::PENDING_ADMIN,
                    Appwrite::Enums::DomainTransferStatusEnum::PENDING_REGISTRY,
                    Appwrite::Enums::DomainTransferStatusEnum::COMPLETED,
                    Appwrite::Enums::DomainTransferStatusEnum::CANCELLED,
                    Appwrite::Enums::DomainTransferStatusEnum::SERVICE_UNAVAILABLE,
                ]

                unless valid_transfer_status.include?(transfer_status)
                    raise ArgumentError, "Invalid " + transfer_status + ". Must be one of: " + valid_transfer_status.join(', ')
                end

                transfer_status
            end
        end
    end
end
