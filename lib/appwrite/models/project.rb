# frozen_string_literal: true

module Appwrite
    module Models
        class Project
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :team_id
            attr_reader :region
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
            attr_reader :ldap_enabled
            attr_reader :ldap_hosts
            attr_reader :ldap_port
            attr_reader :ldap_encryption
            attr_reader :ldap_verification
            attr_reader :ldap_certificate
            attr_reader :ldap_timeout
            attr_reader :ldap_base_dn
            attr_reader :ldap_bind_dn
            attr_reader :ldap_bind_password
            attr_reader :ldap_user_filter
            attr_reader :ldap_required_group_dn
            attr_reader :ldap_id_attribute
            attr_reader :ldap_email_attribute
            attr_reader :ldap_name_attribute
            attr_reader :ldap_phone_attribute
            attr_reader :ping_count
            attr_reader :pinged_at
            attr_reader :labels
            attr_reader :prefs
            attr_reader :status
            attr_reader :onboarding
            attr_reader :auth_methods
            attr_reader :services
            attr_reader :protocols
            attr_reader :blocks
            attr_reader :console_accessed_at
            attr_reader :waf_enabled
            attr_reader :parent_id
            attr_reader :environment_id
            attr_reader :billing_limits
            attr_reader :first_accessed_at
            attr_reader :mcp_accessed_at
            attr_reader :o_auth2_server_enabled
            attr_reader :o_auth2_server_authorization_url
            attr_reader :o_auth2_server_scopes
            attr_reader :o_auth2_server_default_scopes
            attr_reader :o_auth2_server_installation_scopes
            attr_reader :o_auth2_server_authorization_details_types
            attr_reader :o_auth2_server_access_token_duration
            attr_reader :o_auth2_server_refresh_token_duration
            attr_reader :o_auth2_server_public_access_token_duration
            attr_reader :o_auth2_server_public_refresh_token_duration
            attr_reader :o_auth2_server_installation_access_token_duration
            attr_reader :o_auth2_server_confidential_pkce
            attr_reader :o_auth2_server_verification_url
            attr_reader :o_auth2_server_user_code_length
            attr_reader :o_auth2_server_user_code_format
            attr_reader :o_auth2_server_device_code_duration
            attr_reader :o_auth2_server_discovery_url

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                team_id:,
                region:,
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
                ldap_enabled:,
                ldap_hosts:,
                ldap_port:,
                ldap_encryption:,
                ldap_verification:,
                ldap_certificate:,
                ldap_timeout:,
                ldap_base_dn:,
                ldap_bind_dn:,
                ldap_bind_password:,
                ldap_user_filter:,
                ldap_required_group_dn:,
                ldap_id_attribute:,
                ldap_email_attribute:,
                ldap_name_attribute:,
                ldap_phone_attribute:,
                ping_count:,
                pinged_at:,
                labels:,
                prefs: nil,
                status:,
                onboarding:,
                auth_methods:,
                services:,
                protocols:,
                blocks:,
                console_accessed_at:,
                waf_enabled: false,
                parent_id: nil,
                environment_id: nil,
                billing_limits: nil,
                first_accessed_at: nil,
                mcp_accessed_at: nil,
                o_auth2_server_enabled: false,
                o_auth2_server_authorization_url: nil,
                o_auth2_server_scopes: [],
                o_auth2_server_default_scopes: [],
                o_auth2_server_installation_scopes: [],
                o_auth2_server_authorization_details_types: [],
                o_auth2_server_access_token_duration: 0,
                o_auth2_server_refresh_token_duration: 0,
                o_auth2_server_public_access_token_duration: 0,
                o_auth2_server_public_refresh_token_duration: 0,
                o_auth2_server_installation_access_token_duration: 0,
                o_auth2_server_confidential_pkce: false,
                o_auth2_server_verification_url: nil,
                o_auth2_server_user_code_length: 8,
                o_auth2_server_user_code_format: "alphanumeric",
                o_auth2_server_device_code_duration: 600,
                o_auth2_server_discovery_url: nil
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @team_id = team_id
                @region = region
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
                @ldap_enabled = ldap_enabled
                @ldap_hosts = ldap_hosts
                @ldap_port = ldap_port
                @ldap_encryption = ldap_encryption
                @ldap_verification = ldap_verification
                @ldap_certificate = ldap_certificate
                @ldap_timeout = ldap_timeout
                @ldap_base_dn = ldap_base_dn
                @ldap_bind_dn = ldap_bind_dn
                @ldap_bind_password = ldap_bind_password
                @ldap_user_filter = ldap_user_filter
                @ldap_required_group_dn = ldap_required_group_dn
                @ldap_id_attribute = ldap_id_attribute
                @ldap_email_attribute = ldap_email_attribute
                @ldap_name_attribute = ldap_name_attribute
                @ldap_phone_attribute = ldap_phone_attribute
                @ping_count = ping_count
                @pinged_at = pinged_at
                @labels = labels
                @prefs = prefs
                @status = status
                @onboarding = onboarding
                @auth_methods = auth_methods
                @services = services
                @protocols = protocols
                @blocks = blocks
                @console_accessed_at = console_accessed_at
                @waf_enabled = waf_enabled
                @parent_id = parent_id
                @environment_id = environment_id
                @billing_limits = billing_limits
                @first_accessed_at = first_accessed_at
                @mcp_accessed_at = mcp_accessed_at
                @o_auth2_server_enabled = o_auth2_server_enabled
                @o_auth2_server_authorization_url = o_auth2_server_authorization_url
                @o_auth2_server_scopes = o_auth2_server_scopes
                @o_auth2_server_default_scopes = o_auth2_server_default_scopes
                @o_auth2_server_installation_scopes = o_auth2_server_installation_scopes
                @o_auth2_server_authorization_details_types = o_auth2_server_authorization_details_types
                @o_auth2_server_access_token_duration = o_auth2_server_access_token_duration
                @o_auth2_server_refresh_token_duration = o_auth2_server_refresh_token_duration
                @o_auth2_server_public_access_token_duration = o_auth2_server_public_access_token_duration
                @o_auth2_server_public_refresh_token_duration = o_auth2_server_public_refresh_token_duration
                @o_auth2_server_installation_access_token_duration = o_auth2_server_installation_access_token_duration
                @o_auth2_server_confidential_pkce = o_auth2_server_confidential_pkce
                @o_auth2_server_verification_url = o_auth2_server_verification_url
                @o_auth2_server_user_code_length = o_auth2_server_user_code_length
                @o_auth2_server_user_code_format = o_auth2_server_user_code_format
                @o_auth2_server_device_code_duration = o_auth2_server_device_code_duration
                @o_auth2_server_discovery_url = o_auth2_server_discovery_url
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "name" => "", "teamId" => "", "region" => "fra", "smtpEnabled" => false, "smtpSenderName" => "", "smtpSenderEmail" => "", "smtpReplyToName" => "", "smtpReplyToEmail" => "", "smtpHost" => "", "smtpPort" => 0, "smtpUsername" => "", "smtpPassword" => "", "smtpSecure" => "", "ldapEnabled" => false, "ldapHosts" => [], "ldapPort" => 636, "ldapEncryption" => "ldaps", "ldapVerification" => true, "ldapCertificate" => "", "ldapTimeout" => 10, "ldapBaseDn" => "", "ldapBindDn" => "", "ldapBindPassword" => "", "ldapUserFilter" => "(uid={username})", "ldapRequiredGroupDn" => "", "ldapIdAttribute" => "entryUUID", "ldapEmailAttribute" => "mail", "ldapNameAttribute" => "cn", "ldapPhoneAttribute" => "", "pingCount" => 0, "pingedAt" => "", "labels" => [], "status" => "active", "onboarding" => {}, "authMethods" => [], "services" => [], "protocols" => [], "blocks" => [], "consoleAccessedAt" => "" }.merge(map)
                Project.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    team_id: map["teamId"],
                    region: map["region"],
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
                    ldap_enabled: map["ldapEnabled"],
                    ldap_hosts: map["ldapHosts"],
                    ldap_port: map["ldapPort"],
                    ldap_encryption: map["ldapEncryption"],
                    ldap_verification: map["ldapVerification"],
                    ldap_certificate: map["ldapCertificate"],
                    ldap_timeout: map["ldapTimeout"],
                    ldap_base_dn: map["ldapBaseDn"],
                    ldap_bind_dn: map["ldapBindDn"],
                    ldap_bind_password: map["ldapBindPassword"],
                    ldap_user_filter: map["ldapUserFilter"],
                    ldap_required_group_dn: map["ldapRequiredGroupDn"],
                    ldap_id_attribute: map["ldapIdAttribute"],
                    ldap_email_attribute: map["ldapEmailAttribute"],
                    ldap_name_attribute: map["ldapNameAttribute"],
                    ldap_phone_attribute: map["ldapPhoneAttribute"],
                    ping_count: map["pingCount"],
                    pinged_at: map["pingedAt"],
                    labels: map["labels"],
                    prefs: map["prefs"].nil? ? nil : Preferences.from(map: map["prefs"]),
                    status: map["status"],
                    onboarding: map["onboarding"],
                    auth_methods: map["authMethods"].map { |it| ProjectAuthMethod.from(map: it) },
                    services: map["services"].map { |it| ProjectService.from(map: it) },
                    protocols: map["protocols"].map { |it| ProjectProtocol.from(map: it) },
                    blocks: map["blocks"].map { |it| Block.from(map: it) },
                    console_accessed_at: map["consoleAccessedAt"],
                    waf_enabled: map["wafEnabled"],
                    parent_id: map["parentId"],
                    environment_id: map["environmentId"],
                    billing_limits: map["billingLimits"].nil? ? nil : BillingLimits.from(map: map["billingLimits"]),
                    first_accessed_at: map["firstAccessedAt"],
                    mcp_accessed_at: map["mcpAccessedAt"],
                    o_auth2_server_enabled: map["oAuth2ServerEnabled"],
                    o_auth2_server_authorization_url: map["oAuth2ServerAuthorizationUrl"],
                    o_auth2_server_scopes: map["oAuth2ServerScopes"],
                    o_auth2_server_default_scopes: map["oAuth2ServerDefaultScopes"],
                    o_auth2_server_installation_scopes: map["oAuth2ServerInstallationScopes"],
                    o_auth2_server_authorization_details_types: map["oAuth2ServerAuthorizationDetailsTypes"],
                    o_auth2_server_access_token_duration: map["oAuth2ServerAccessTokenDuration"],
                    o_auth2_server_refresh_token_duration: map["oAuth2ServerRefreshTokenDuration"],
                    o_auth2_server_public_access_token_duration: map["oAuth2ServerPublicAccessTokenDuration"],
                    o_auth2_server_public_refresh_token_duration: map["oAuth2ServerPublicRefreshTokenDuration"],
                    o_auth2_server_installation_access_token_duration: map["oAuth2ServerInstallationAccessTokenDuration"],
                    o_auth2_server_confidential_pkce: map["oAuth2ServerConfidentialPkce"],
                    o_auth2_server_verification_url: map["oAuth2ServerVerificationUrl"],
                    o_auth2_server_user_code_length: map["oAuth2ServerUserCodeLength"],
                    o_auth2_server_user_code_format: map["oAuth2ServerUserCodeFormat"],
                    o_auth2_server_device_code_duration: map["oAuth2ServerDeviceCodeDuration"],
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
                    "ldapEnabled": @ldap_enabled,
                    "ldapHosts": @ldap_hosts,
                    "ldapPort": @ldap_port,
                    "ldapEncryption": @ldap_encryption,
                    "ldapVerification": @ldap_verification,
                    "ldapCertificate": @ldap_certificate,
                    "ldapTimeout": @ldap_timeout,
                    "ldapBaseDn": @ldap_base_dn,
                    "ldapBindDn": @ldap_bind_dn,
                    "ldapBindPassword": @ldap_bind_password,
                    "ldapUserFilter": @ldap_user_filter,
                    "ldapRequiredGroupDn": @ldap_required_group_dn,
                    "ldapIdAttribute": @ldap_id_attribute,
                    "ldapEmailAttribute": @ldap_email_attribute,
                    "ldapNameAttribute": @ldap_name_attribute,
                    "ldapPhoneAttribute": @ldap_phone_attribute,
                    "pingCount": @ping_count,
                    "pingedAt": @pinged_at,
                    "labels": @labels,
                    "prefs": @prefs&.to_map,
                    "status": @status,
                    "onboarding": @onboarding,
                    "authMethods": @auth_methods.map { |it| it.to_map },
                    "services": @services.map { |it| it.to_map },
                    "protocols": @protocols.map { |it| it.to_map },
                    "blocks": @blocks.map { |it| it.to_map },
                    "consoleAccessedAt": @console_accessed_at,
                    "wafEnabled": @waf_enabled,
                    "parentId": @parent_id,
                    "environmentId": @environment_id,
                    "billingLimits": @billing_limits&.to_map,
                    "firstAccessedAt": @first_accessed_at,
                    "mcpAccessedAt": @mcp_accessed_at,
                    "oAuth2ServerEnabled": @o_auth2_server_enabled,
                    "oAuth2ServerAuthorizationUrl": @o_auth2_server_authorization_url,
                    "oAuth2ServerScopes": @o_auth2_server_scopes,
                    "oAuth2ServerDefaultScopes": @o_auth2_server_default_scopes,
                    "oAuth2ServerInstallationScopes": @o_auth2_server_installation_scopes,
                    "oAuth2ServerAuthorizationDetailsTypes": @o_auth2_server_authorization_details_types,
                    "oAuth2ServerAccessTokenDuration": @o_auth2_server_access_token_duration,
                    "oAuth2ServerRefreshTokenDuration": @o_auth2_server_refresh_token_duration,
                    "oAuth2ServerPublicAccessTokenDuration": @o_auth2_server_public_access_token_duration,
                    "oAuth2ServerPublicRefreshTokenDuration": @o_auth2_server_public_refresh_token_duration,
                    "oAuth2ServerInstallationAccessTokenDuration": @o_auth2_server_installation_access_token_duration,
                    "oAuth2ServerConfidentialPkce": @o_auth2_server_confidential_pkce,
                    "oAuth2ServerVerificationUrl": @o_auth2_server_verification_url,
                    "oAuth2ServerUserCodeLength": @o_auth2_server_user_code_length,
                    "oAuth2ServerUserCodeFormat": @o_auth2_server_user_code_format,
                    "oAuth2ServerDeviceCodeDuration": @o_auth2_server_device_code_duration,
                    "oAuth2ServerDiscoveryUrl": @o_auth2_server_discovery_url
                }
            end
        end
    end
end
