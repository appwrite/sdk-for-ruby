#frozen_string_literal: true

module Appwrite
    module Models
        class Project
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :team_id
            attr_reader :region
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
            attr_reader :blocks
            attr_reader :console_accessed_at
            attr_reader :billing_limits
            attr_reader :o_auth2_server_enabled
            attr_reader :o_auth2_server_authorization_url
            attr_reader :o_auth2_server_scopes
            attr_reader :o_auth2_server_access_token_duration
            attr_reader :o_auth2_server_refresh_token_duration
            attr_reader :o_auth2_server_public_access_token_duration
            attr_reader :o_auth2_server_public_refresh_token_duration
            attr_reader :o_auth2_server_confidential_pkce
            attr_reader :o_auth2_server_discovery_url

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                team_id:,
                region:,
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
                blocks:,
                console_accessed_at:,
                billing_limits: ,
                o_auth2_server_enabled:,
                o_auth2_server_authorization_url:,
                o_auth2_server_scopes:,
                o_auth2_server_access_token_duration:,
                o_auth2_server_refresh_token_duration:,
                o_auth2_server_public_access_token_duration:,
                o_auth2_server_public_refresh_token_duration:,
                o_auth2_server_confidential_pkce:,
                o_auth2_server_discovery_url:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @team_id = team_id
                @region = region
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
                @blocks = blocks
                @console_accessed_at = console_accessed_at
                @billing_limits = billing_limits
                @o_auth2_server_enabled = o_auth2_server_enabled
                @o_auth2_server_authorization_url = o_auth2_server_authorization_url
                @o_auth2_server_scopes = o_auth2_server_scopes
                @o_auth2_server_access_token_duration = o_auth2_server_access_token_duration
                @o_auth2_server_refresh_token_duration = o_auth2_server_refresh_token_duration
                @o_auth2_server_public_access_token_duration = o_auth2_server_public_access_token_duration
                @o_auth2_server_public_refresh_token_duration = o_auth2_server_public_refresh_token_duration
                @o_auth2_server_confidential_pkce = o_auth2_server_confidential_pkce
                @o_auth2_server_discovery_url = o_auth2_server_discovery_url
            end

            def self.from(map:)
                Project.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    team_id: map["teamId"],
                    region: map["region"],
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
                    blocks: map["blocks"].map { |it| Block.from(map: it) },
                    console_accessed_at: map["consoleAccessedAt"],
                    billing_limits: BillingLimits.from(map: map["billingLimits"]),
                    o_auth2_server_enabled: map["oAuth2ServerEnabled"],
                    o_auth2_server_authorization_url: map["oAuth2ServerAuthorizationUrl"],
                    o_auth2_server_scopes: map["oAuth2ServerScopes"],
                    o_auth2_server_access_token_duration: map["oAuth2ServerAccessTokenDuration"],
                    o_auth2_server_refresh_token_duration: map["oAuth2ServerRefreshTokenDuration"],
                    o_auth2_server_public_access_token_duration: map["oAuth2ServerPublicAccessTokenDuration"],
                    o_auth2_server_public_refresh_token_duration: map["oAuth2ServerPublicRefreshTokenDuration"],
                    o_auth2_server_confidential_pkce: map["oAuth2ServerConfidentialPkce"],
                    o_auth2_server_discovery_url: map["oAuth2ServerDiscoveryUrl"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "teamId": @team_id,
                    "region": @region,
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
                    "blocks": @blocks.map { |it| it.to_map },
                    "consoleAccessedAt": @console_accessed_at,
                    "billingLimits": @billing_limits.to_map,
                    "oAuth2ServerEnabled": @o_auth2_server_enabled,
                    "oAuth2ServerAuthorizationUrl": @o_auth2_server_authorization_url,
                    "oAuth2ServerScopes": @o_auth2_server_scopes,
                    "oAuth2ServerAccessTokenDuration": @o_auth2_server_access_token_duration,
                    "oAuth2ServerRefreshTokenDuration": @o_auth2_server_refresh_token_duration,
                    "oAuth2ServerPublicAccessTokenDuration": @o_auth2_server_public_access_token_duration,
                    "oAuth2ServerPublicRefreshTokenDuration": @o_auth2_server_public_refresh_token_duration,
                    "oAuth2ServerConfidentialPkce": @o_auth2_server_confidential_pkce,
                    "oAuth2ServerDiscoveryUrl": @o_auth2_server_discovery_url
                }
            end
        end
    end
end
