#frozen_string_literal: true

module Appwrite
    module Models
        class Project
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :team_id
            attr_reader :dev_keys
            attr_reader :smtp_enabled
            attr_reader :smtp_sender_name
            attr_reader :smtp_sender_email
            attr_reader :smtp_reply_to_name
            attr_reader :smtp_reply_to_email
            attr_reader :smtp_host
            attr_reader :smtp_port
            attr_reader :smtp_username
            attr_reader :smtp_password
            attr_reader :smtp_secure
            attr_reader :ping_count
            attr_reader :pinged_at
            attr_reader :labels
            attr_reader :status
            attr_reader :auth_methods
            attr_reader :services
            attr_reader :protocols
            attr_reader :region
            attr_reader :billing_limits
            attr_reader :blocks
            attr_reader :console_accessed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                team_id:,
                dev_keys:,
                smtp_enabled:,
                smtp_sender_name:,
                smtp_sender_email:,
                smtp_reply_to_name:,
                smtp_reply_to_email:,
                smtp_host:,
                smtp_port:,
                smtp_username:,
                smtp_password:,
                smtp_secure:,
                ping_count:,
                pinged_at:,
                labels:,
                status:,
                auth_methods:,
                services:,
                protocols:,
                region:,
                billing_limits: ,
                blocks:,
                console_accessed_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @team_id = team_id
                @dev_keys = dev_keys
                @smtp_enabled = smtp_enabled
                @smtp_sender_name = smtp_sender_name
                @smtp_sender_email = smtp_sender_email
                @smtp_reply_to_name = smtp_reply_to_name
                @smtp_reply_to_email = smtp_reply_to_email
                @smtp_host = smtp_host
                @smtp_port = smtp_port
                @smtp_username = smtp_username
                @smtp_password = smtp_password
                @smtp_secure = smtp_secure
                @ping_count = ping_count
                @pinged_at = pinged_at
                @labels = labels
                @status = status
                @auth_methods = auth_methods
                @services = services
                @protocols = protocols
                @region = region
                @billing_limits = billing_limits
                @blocks = blocks
                @console_accessed_at = console_accessed_at
            end

            def self.from(map:)
                Project.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    team_id: map["teamId"],
                    dev_keys: map["devKeys"].map { |it| DevKey.from(map: it) },
                    smtp_enabled: map["smtpEnabled"],
                    smtp_sender_name: map["smtpSenderName"],
                    smtp_sender_email: map["smtpSenderEmail"],
                    smtp_reply_to_name: map["smtpReplyToName"],
                    smtp_reply_to_email: map["smtpReplyToEmail"],
                    smtp_host: map["smtpHost"],
                    smtp_port: map["smtpPort"],
                    smtp_username: map["smtpUsername"],
                    smtp_password: map["smtpPassword"],
                    smtp_secure: map["smtpSecure"],
                    ping_count: map["pingCount"],
                    pinged_at: map["pingedAt"],
                    labels: map["labels"],
                    status: map["status"],
                    auth_methods: map["authMethods"].map { |it| ProjectAuthMethod.from(map: it) },
                    services: map["services"].map { |it| ProjectService.from(map: it) },
                    protocols: map["protocols"].map { |it| ProjectProtocol.from(map: it) },
                    region: map["region"],
                    billing_limits: BillingLimits.from(map: map["billingLimits"]),
                    blocks: map["blocks"].map { |it| Block.from(map: it) },
                    console_accessed_at: map["consoleAccessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "teamId": @team_id,
                    "devKeys": @dev_keys.map { |it| it.to_map },
                    "smtpEnabled": @smtp_enabled,
                    "smtpSenderName": @smtp_sender_name,
                    "smtpSenderEmail": @smtp_sender_email,
                    "smtpReplyToName": @smtp_reply_to_name,
                    "smtpReplyToEmail": @smtp_reply_to_email,
                    "smtpHost": @smtp_host,
                    "smtpPort": @smtp_port,
                    "smtpUsername": @smtp_username,
                    "smtpPassword": @smtp_password,
                    "smtpSecure": @smtp_secure,
                    "pingCount": @ping_count,
                    "pingedAt": @pinged_at,
                    "labels": @labels,
                    "status": @status,
                    "authMethods": @auth_methods.map { |it| it.to_map },
                    "services": @services.map { |it| it.to_map },
                    "protocols": @protocols.map { |it| it.to_map },
                    "region": @region,
                    "billingLimits": @billing_limits.to_map,
                    "blocks": @blocks.map { |it| it.to_map },
                    "consoleAccessedAt": @console_accessed_at
                }
            end
        end
    end
end
