#frozen_string_literal: true

module Appwrite
    module Models
        class Project
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :description
            attr_reader :team_id
            attr_reader :logo
            attr_reader :url
            attr_reader :legal_name
            attr_reader :legal_country
            attr_reader :legal_state
            attr_reader :legal_city
            attr_reader :legal_address
            attr_reader :legal_tax_id
            attr_reader :auth_duration
            attr_reader :auth_limit
            attr_reader :auth_sessions_limit
            attr_reader :auth_password_history
            attr_reader :auth_password_dictionary
            attr_reader :auth_personal_data_check
            attr_reader :auth_disposable_emails
            attr_reader :auth_canonical_emails
            attr_reader :auth_free_emails
            attr_reader :auth_mock_numbers
            attr_reader :auth_session_alerts
            attr_reader :auth_memberships_user_name
            attr_reader :auth_memberships_user_email
            attr_reader :auth_memberships_mfa
            attr_reader :auth_invalidate_sessions
            attr_reader :o_auth_providers
            attr_reader :platforms
            attr_reader :webhooks
            attr_reader :keys
            attr_reader :dev_keys
            attr_reader :smtp_enabled
            attr_reader :smtp_sender_name
            attr_reader :smtp_sender_email
            attr_reader :smtp_reply_to
            attr_reader :smtp_host
            attr_reader :smtp_port
            attr_reader :smtp_username
            attr_reader :smtp_password
            attr_reader :smtp_secure
            attr_reader :ping_count
            attr_reader :pinged_at
            attr_reader :labels
            attr_reader :status
            attr_reader :auth_email_password
            attr_reader :auth_users_auth_magic_url
            attr_reader :auth_email_otp
            attr_reader :auth_anonymous
            attr_reader :auth_invites
            attr_reader :auth_jwt
            attr_reader :auth_phone
            attr_reader :service_status_for_account
            attr_reader :service_status_for_avatars
            attr_reader :service_status_for_databases
            attr_reader :service_status_for_tablesdb
            attr_reader :service_status_for_locale
            attr_reader :service_status_for_health
            attr_reader :service_status_for_project
            attr_reader :service_status_for_storage
            attr_reader :service_status_for_teams
            attr_reader :service_status_for_users
            attr_reader :service_status_for_vcs
            attr_reader :service_status_for_sites
            attr_reader :service_status_for_functions
            attr_reader :service_status_for_proxy
            attr_reader :service_status_for_graphql
            attr_reader :service_status_for_migrations
            attr_reader :service_status_for_messaging
            attr_reader :protocol_status_for_rest
            attr_reader :protocol_status_for_graphql
            attr_reader :protocol_status_for_websocket
            attr_reader :region
            attr_reader :billing_limits
            attr_reader :blocks
            attr_reader :console_accessed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                description:,
                team_id:,
                logo:,
                url:,
                legal_name:,
                legal_country:,
                legal_state:,
                legal_city:,
                legal_address:,
                legal_tax_id:,
                auth_duration:,
                auth_limit:,
                auth_sessions_limit:,
                auth_password_history:,
                auth_password_dictionary:,
                auth_personal_data_check:,
                auth_disposable_emails:,
                auth_canonical_emails:,
                auth_free_emails:,
                auth_mock_numbers:,
                auth_session_alerts:,
                auth_memberships_user_name:,
                auth_memberships_user_email:,
                auth_memberships_mfa:,
                auth_invalidate_sessions:,
                o_auth_providers:,
                platforms:,
                webhooks:,
                keys:,
                dev_keys:,
                smtp_enabled:,
                smtp_sender_name:,
                smtp_sender_email:,
                smtp_reply_to:,
                smtp_host:,
                smtp_port:,
                smtp_username:,
                smtp_password:,
                smtp_secure:,
                ping_count:,
                pinged_at:,
                labels:,
                status:,
                auth_email_password:,
                auth_users_auth_magic_url:,
                auth_email_otp:,
                auth_anonymous:,
                auth_invites:,
                auth_jwt:,
                auth_phone:,
                service_status_for_account:,
                service_status_for_avatars:,
                service_status_for_databases:,
                service_status_for_tablesdb:,
                service_status_for_locale:,
                service_status_for_health:,
                service_status_for_project:,
                service_status_for_storage:,
                service_status_for_teams:,
                service_status_for_users:,
                service_status_for_vcs:,
                service_status_for_sites:,
                service_status_for_functions:,
                service_status_for_proxy:,
                service_status_for_graphql:,
                service_status_for_migrations:,
                service_status_for_messaging:,
                protocol_status_for_rest:,
                protocol_status_for_graphql:,
                protocol_status_for_websocket:,
                region:,
                billing_limits:,
                blocks:,
                console_accessed_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @description = description
                @team_id = team_id
                @logo = logo
                @url = url
                @legal_name = legal_name
                @legal_country = legal_country
                @legal_state = legal_state
                @legal_city = legal_city
                @legal_address = legal_address
                @legal_tax_id = legal_tax_id
                @auth_duration = auth_duration
                @auth_limit = auth_limit
                @auth_sessions_limit = auth_sessions_limit
                @auth_password_history = auth_password_history
                @auth_password_dictionary = auth_password_dictionary
                @auth_personal_data_check = auth_personal_data_check
                @auth_disposable_emails = auth_disposable_emails
                @auth_canonical_emails = auth_canonical_emails
                @auth_free_emails = auth_free_emails
                @auth_mock_numbers = auth_mock_numbers
                @auth_session_alerts = auth_session_alerts
                @auth_memberships_user_name = auth_memberships_user_name
                @auth_memberships_user_email = auth_memberships_user_email
                @auth_memberships_mfa = auth_memberships_mfa
                @auth_invalidate_sessions = auth_invalidate_sessions
                @o_auth_providers = o_auth_providers
                @platforms = platforms
                @webhooks = webhooks
                @keys = keys
                @dev_keys = dev_keys
                @smtp_enabled = smtp_enabled
                @smtp_sender_name = smtp_sender_name
                @smtp_sender_email = smtp_sender_email
                @smtp_reply_to = smtp_reply_to
                @smtp_host = smtp_host
                @smtp_port = smtp_port
                @smtp_username = smtp_username
                @smtp_password = smtp_password
                @smtp_secure = smtp_secure
                @ping_count = ping_count
                @pinged_at = pinged_at
                @labels = labels
                @status = status
                @auth_email_password = auth_email_password
                @auth_users_auth_magic_url = auth_users_auth_magic_url
                @auth_email_otp = auth_email_otp
                @auth_anonymous = auth_anonymous
                @auth_invites = auth_invites
                @auth_jwt = auth_jwt
                @auth_phone = auth_phone
                @service_status_for_account = service_status_for_account
                @service_status_for_avatars = service_status_for_avatars
                @service_status_for_databases = service_status_for_databases
                @service_status_for_tablesdb = service_status_for_tablesdb
                @service_status_for_locale = service_status_for_locale
                @service_status_for_health = service_status_for_health
                @service_status_for_project = service_status_for_project
                @service_status_for_storage = service_status_for_storage
                @service_status_for_teams = service_status_for_teams
                @service_status_for_users = service_status_for_users
                @service_status_for_vcs = service_status_for_vcs
                @service_status_for_sites = service_status_for_sites
                @service_status_for_functions = service_status_for_functions
                @service_status_for_proxy = service_status_for_proxy
                @service_status_for_graphql = service_status_for_graphql
                @service_status_for_migrations = service_status_for_migrations
                @service_status_for_messaging = service_status_for_messaging
                @protocol_status_for_rest = protocol_status_for_rest
                @protocol_status_for_graphql = protocol_status_for_graphql
                @protocol_status_for_websocket = protocol_status_for_websocket
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
                    description: map["description"],
                    team_id: map["teamId"],
                    logo: map["logo"],
                    url: map["url"],
                    legal_name: map["legalName"],
                    legal_country: map["legalCountry"],
                    legal_state: map["legalState"],
                    legal_city: map["legalCity"],
                    legal_address: map["legalAddress"],
                    legal_tax_id: map["legalTaxId"],
                    auth_duration: map["authDuration"],
                    auth_limit: map["authLimit"],
                    auth_sessions_limit: map["authSessionsLimit"],
                    auth_password_history: map["authPasswordHistory"],
                    auth_password_dictionary: map["authPasswordDictionary"],
                    auth_personal_data_check: map["authPersonalDataCheck"],
                    auth_disposable_emails: map["authDisposableEmails"],
                    auth_canonical_emails: map["authCanonicalEmails"],
                    auth_free_emails: map["authFreeEmails"],
                    auth_mock_numbers: map["authMockNumbers"].map { |it| MockNumber.from(map: it) },
                    auth_session_alerts: map["authSessionAlerts"],
                    auth_memberships_user_name: map["authMembershipsUserName"],
                    auth_memberships_user_email: map["authMembershipsUserEmail"],
                    auth_memberships_mfa: map["authMembershipsMfa"],
                    auth_invalidate_sessions: map["authInvalidateSessions"],
                    o_auth_providers: map["oAuthProviders"].map { |it| AuthProvider.from(map: it) },
                    platforms: map["platforms"],
                    webhooks: map["webhooks"].map { |it| Webhook.from(map: it) },
                    keys: map["keys"].map { |it| Key.from(map: it) },
                    dev_keys: map["devKeys"].map { |it| DevKey.from(map: it) },
                    smtp_enabled: map["smtpEnabled"],
                    smtp_sender_name: map["smtpSenderName"],
                    smtp_sender_email: map["smtpSenderEmail"],
                    smtp_reply_to: map["smtpReplyTo"],
                    smtp_host: map["smtpHost"],
                    smtp_port: map["smtpPort"],
                    smtp_username: map["smtpUsername"],
                    smtp_password: map["smtpPassword"],
                    smtp_secure: map["smtpSecure"],
                    ping_count: map["pingCount"],
                    pinged_at: map["pingedAt"],
                    labels: map["labels"],
                    status: map["status"],
                    auth_email_password: map["authEmailPassword"],
                    auth_users_auth_magic_url: map["authUsersAuthMagicURL"],
                    auth_email_otp: map["authEmailOtp"],
                    auth_anonymous: map["authAnonymous"],
                    auth_invites: map["authInvites"],
                    auth_jwt: map["authJWT"],
                    auth_phone: map["authPhone"],
                    service_status_for_account: map["serviceStatusForAccount"],
                    service_status_for_avatars: map["serviceStatusForAvatars"],
                    service_status_for_databases: map["serviceStatusForDatabases"],
                    service_status_for_tablesdb: map["serviceStatusForTablesdb"],
                    service_status_for_locale: map["serviceStatusForLocale"],
                    service_status_for_health: map["serviceStatusForHealth"],
                    service_status_for_project: map["serviceStatusForProject"],
                    service_status_for_storage: map["serviceStatusForStorage"],
                    service_status_for_teams: map["serviceStatusForTeams"],
                    service_status_for_users: map["serviceStatusForUsers"],
                    service_status_for_vcs: map["serviceStatusForVcs"],
                    service_status_for_sites: map["serviceStatusForSites"],
                    service_status_for_functions: map["serviceStatusForFunctions"],
                    service_status_for_proxy: map["serviceStatusForProxy"],
                    service_status_for_graphql: map["serviceStatusForGraphql"],
                    service_status_for_migrations: map["serviceStatusForMigrations"],
                    service_status_for_messaging: map["serviceStatusForMessaging"],
                    protocol_status_for_rest: map["protocolStatusForRest"],
                    protocol_status_for_graphql: map["protocolStatusForGraphql"],
                    protocol_status_for_websocket: map["protocolStatusForWebsocket"],
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
                    "description": @description,
                    "teamId": @team_id,
                    "logo": @logo,
                    "url": @url,
                    "legalName": @legal_name,
                    "legalCountry": @legal_country,
                    "legalState": @legal_state,
                    "legalCity": @legal_city,
                    "legalAddress": @legal_address,
                    "legalTaxId": @legal_tax_id,
                    "authDuration": @auth_duration,
                    "authLimit": @auth_limit,
                    "authSessionsLimit": @auth_sessions_limit,
                    "authPasswordHistory": @auth_password_history,
                    "authPasswordDictionary": @auth_password_dictionary,
                    "authPersonalDataCheck": @auth_personal_data_check,
                    "authDisposableEmails": @auth_disposable_emails,
                    "authCanonicalEmails": @auth_canonical_emails,
                    "authFreeEmails": @auth_free_emails,
                    "authMockNumbers": @auth_mock_numbers.map { |it| it.to_map },
                    "authSessionAlerts": @auth_session_alerts,
                    "authMembershipsUserName": @auth_memberships_user_name,
                    "authMembershipsUserEmail": @auth_memberships_user_email,
                    "authMembershipsMfa": @auth_memberships_mfa,
                    "authInvalidateSessions": @auth_invalidate_sessions,
                    "oAuthProviders": @o_auth_providers.map { |it| it.to_map },
                    "platforms": @platforms,
                    "webhooks": @webhooks.map { |it| it.to_map },
                    "keys": @keys.map { |it| it.to_map },
                    "devKeys": @dev_keys.map { |it| it.to_map },
                    "smtpEnabled": @smtp_enabled,
                    "smtpSenderName": @smtp_sender_name,
                    "smtpSenderEmail": @smtp_sender_email,
                    "smtpReplyTo": @smtp_reply_to,
                    "smtpHost": @smtp_host,
                    "smtpPort": @smtp_port,
                    "smtpUsername": @smtp_username,
                    "smtpPassword": @smtp_password,
                    "smtpSecure": @smtp_secure,
                    "pingCount": @ping_count,
                    "pingedAt": @pinged_at,
                    "labels": @labels,
                    "status": @status,
                    "authEmailPassword": @auth_email_password,
                    "authUsersAuthMagicURL": @auth_users_auth_magic_url,
                    "authEmailOtp": @auth_email_otp,
                    "authAnonymous": @auth_anonymous,
                    "authInvites": @auth_invites,
                    "authJWT": @auth_jwt,
                    "authPhone": @auth_phone,
                    "serviceStatusForAccount": @service_status_for_account,
                    "serviceStatusForAvatars": @service_status_for_avatars,
                    "serviceStatusForDatabases": @service_status_for_databases,
                    "serviceStatusForTablesdb": @service_status_for_tablesdb,
                    "serviceStatusForLocale": @service_status_for_locale,
                    "serviceStatusForHealth": @service_status_for_health,
                    "serviceStatusForProject": @service_status_for_project,
                    "serviceStatusForStorage": @service_status_for_storage,
                    "serviceStatusForTeams": @service_status_for_teams,
                    "serviceStatusForUsers": @service_status_for_users,
                    "serviceStatusForVcs": @service_status_for_vcs,
                    "serviceStatusForSites": @service_status_for_sites,
                    "serviceStatusForFunctions": @service_status_for_functions,
                    "serviceStatusForProxy": @service_status_for_proxy,
                    "serviceStatusForGraphql": @service_status_for_graphql,
                    "serviceStatusForMigrations": @service_status_for_migrations,
                    "serviceStatusForMessaging": @service_status_for_messaging,
                    "protocolStatusForRest": @protocol_status_for_rest,
                    "protocolStatusForGraphql": @protocol_status_for_graphql,
                    "protocolStatusForWebsocket": @protocol_status_for_websocket,
                    "region": @region,
                    "billingLimits": @billing_limits.to_map,
                    "blocks": @blocks.map { |it| it.to_map },
                    "consoleAccessedAt": @console_accessed_at
                }
            end
        end
    end
end
