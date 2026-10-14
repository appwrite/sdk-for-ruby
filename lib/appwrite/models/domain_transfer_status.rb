# frozen_string_literal: true

module Appwrite
    module Models
        class DomainTransferStatus
            attr_reader :status
            attr_reader :reason
            attr_reader :timestamp

            def initialize(
                status:,
                reason:,
                timestamp:
            )
                @status = validate_status(status)
                @reason = reason
                @timestamp = timestamp
            end

            def self.from(map:)
                map = { "status" => "pending_registry", "reason" => "", "timestamp" => "" }.merge(map)
                DomainTransferStatus.new(
                    status: map["status"],
                    reason: map["reason"],
                    timestamp: map["timestamp"]
                )
            end

            def to_map
                {
                    "status": @status,
                    "reason": @reason,
                    "timestamp": @timestamp
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::DomainTransferStatusEnum::TRANSFERRABLE,
                    Appwrite::Enums::DomainTransferStatusEnum::NOT_TRANSFERRABLE,
                    Appwrite::Enums::DomainTransferStatusEnum::PENDING_OWNER,
                    Appwrite::Enums::DomainTransferStatusEnum::PENDING_ADMIN,
                    Appwrite::Enums::DomainTransferStatusEnum::PENDING_REGISTRY,
                    Appwrite::Enums::DomainTransferStatusEnum::COMPLETED,
                    Appwrite::Enums::DomainTransferStatusEnum::CANCELLED,
                    Appwrite::Enums::DomainTransferStatusEnum::SERVICE_UNAVAILABLE,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end
        end
    end
end
