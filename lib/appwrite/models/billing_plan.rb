# frozen_string_literal: true

module Appwrite
    module Models
        class BillingPlan
            attr_reader :id
            attr_reader :name
            attr_reader :desc
            attr_reader :order
            attr_reader :price
            attr_reader :trial
            attr_reader :bandwidth
            attr_reader :storage
            attr_reader :image_transformations
            attr_reader :screenshots_generated
            attr_reader :members
            attr_reader :webhooks
            attr_reader :waf_rules
            attr_reader :projects
            attr_reader :platforms
            attr_reader :users
            attr_reader :teams
            attr_reader :databases
            attr_reader :databases_reads
            attr_reader :databases_writes
            attr_reader :databases_batch_size
            attr_reader :buckets
            attr_reader :file_size
            attr_reader :functions
            attr_reader :sites
            attr_reader :executions
            attr_reader :executions_retention_count
            attr_reader :gb_hours
            attr_reader :realtime
            attr_reader :realtime_messages
            attr_reader :messages
            attr_reader :topics
            attr_reader :auth_phone
            attr_reader :domains
            attr_reader :activity_logs
            attr_reader :usage_logs
            attr_reader :usage_logs_intervals
            attr_reader :project_inactivity_days
            attr_reader :alert_limit
            attr_reader :usage
            attr_reader :addons
            attr_reader :budget_cap_enabled
            attr_reader :custom_smtp
            attr_reader :email_branding
            attr_reader :requires_payment_method
            attr_reader :requires_billing_address
            attr_reader :is_available
            attr_reader :self_service
            attr_reader :premium_support
            attr_reader :budgeting
            attr_reader :supports_mock_numbers
            attr_reader :supports_organization_roles
            attr_reader :supports_credits
            attr_reader :supports_dedicated_databases
            attr_reader :supports_disposable_email_validation
            attr_reader :supports_canonical_email_validation
            attr_reader :supports_free_email_validation
            attr_reader :supports_corporate_email_validation
            attr_reader :supports_project_specific_roles
            attr_reader :backups_enabled
            attr_reader :usage_per_project
            attr_reader :supported_addons
            attr_reader :backup_policies
            attr_reader :deployment_size
            attr_reader :build_size
            attr_reader :databases_allow_encrypt
            attr_reader :limits
            attr_reader :group
            attr_reader :program
            attr_reader :database_compute_credit
            attr_reader :dedicated_databases

            def initialize(
                id:,
                name:,
                desc:,
                order:,
                price:,
                trial:,
                bandwidth:,
                storage:,
                image_transformations:,
                screenshots_generated:,
                members:,
                webhooks:,
                waf_rules:,
                projects:,
                platforms:,
                users:,
                teams:,
                databases:,
                databases_reads:,
                databases_writes:,
                databases_batch_size:,
                buckets:,
                file_size:,
                functions:,
                sites:,
                executions:,
                executions_retention_count:,
                gb_hours:,
                realtime:,
                realtime_messages:,
                messages:,
                topics:,
                auth_phone:,
                domains:,
                activity_logs:,
                usage_logs:,
                usage_logs_intervals:,
                project_inactivity_days:,
                alert_limit:,
                usage:,
                addons:,
                budget_cap_enabled:,
                custom_smtp:,
                email_branding:,
                requires_payment_method:,
                requires_billing_address:,
                is_available:,
                self_service:,
                premium_support:,
                budgeting:,
                supports_mock_numbers:,
                supports_organization_roles:,
                supports_credits:,
                supports_dedicated_databases:,
                supports_disposable_email_validation:,
                supports_canonical_email_validation:,
                supports_free_email_validation:,
                supports_corporate_email_validation:,
                supports_project_specific_roles:,
                backups_enabled:,
                usage_per_project:,
                supported_addons:,
                backup_policies:,
                deployment_size:,
                build_size:,
                databases_allow_encrypt:,
                limits:,
                group:,
                program:,
                database_compute_credit:,
                dedicated_databases:
            )
                @id = id
                @name = name
                @desc = desc
                @order = order
                @price = price
                @trial = trial
                @bandwidth = bandwidth
                @storage = storage
                @image_transformations = image_transformations
                @screenshots_generated = screenshots_generated
                @members = members
                @webhooks = webhooks
                @waf_rules = waf_rules
                @projects = projects
                @platforms = platforms
                @users = users
                @teams = teams
                @databases = databases
                @databases_reads = databases_reads
                @databases_writes = databases_writes
                @databases_batch_size = databases_batch_size
                @buckets = buckets
                @file_size = file_size
                @functions = functions
                @sites = sites
                @executions = executions
                @executions_retention_count = executions_retention_count
                @gb_hours = gb_hours
                @realtime = realtime
                @realtime_messages = realtime_messages
                @messages = messages
                @topics = topics
                @auth_phone = auth_phone
                @domains = domains
                @activity_logs = activity_logs
                @usage_logs = usage_logs
                @usage_logs_intervals = usage_logs_intervals
                @project_inactivity_days = project_inactivity_days
                @alert_limit = alert_limit
                @usage = usage
                @addons = addons
                @budget_cap_enabled = budget_cap_enabled
                @custom_smtp = custom_smtp
                @email_branding = email_branding
                @requires_payment_method = requires_payment_method
                @requires_billing_address = requires_billing_address
                @is_available = is_available
                @self_service = self_service
                @premium_support = premium_support
                @budgeting = budgeting
                @supports_mock_numbers = supports_mock_numbers
                @supports_organization_roles = supports_organization_roles
                @supports_credits = supports_credits
                @supports_dedicated_databases = supports_dedicated_databases
                @supports_disposable_email_validation = supports_disposable_email_validation
                @supports_canonical_email_validation = supports_canonical_email_validation
                @supports_free_email_validation = supports_free_email_validation
                @supports_corporate_email_validation = supports_corporate_email_validation
                @supports_project_specific_roles = supports_project_specific_roles
                @backups_enabled = backups_enabled
                @usage_per_project = usage_per_project
                @supported_addons = supported_addons
                @backup_policies = backup_policies
                @deployment_size = deployment_size
                @build_size = build_size
                @databases_allow_encrypt = databases_allow_encrypt
                @limits = limits
                @group = validate_group(group)
                @program = program
                @database_compute_credit = database_compute_credit
                @dedicated_databases = dedicated_databases
            end

            def self.from(map:)
                BillingPlan.new(
                    id: map["$id"],
                    name: map["name"],
                    desc: map["desc"],
                    order: map["order"],
                    price: map["price"],
                    trial: map["trial"],
                    bandwidth: map["bandwidth"],
                    storage: map["storage"],
                    image_transformations: map["imageTransformations"],
                    screenshots_generated: map["screenshotsGenerated"],
                    members: map["members"],
                    webhooks: map["webhooks"],
                    waf_rules: map["wafRules"],
                    projects: map["projects"],
                    platforms: map["platforms"],
                    users: map["users"],
                    teams: map["teams"],
                    databases: map["databases"],
                    databases_reads: map["databasesReads"],
                    databases_writes: map["databasesWrites"],
                    databases_batch_size: map["databasesBatchSize"],
                    buckets: map["buckets"],
                    file_size: map["fileSize"],
                    functions: map["functions"],
                    sites: map["sites"],
                    executions: map["executions"],
                    executions_retention_count: map["executionsRetentionCount"],
                    gb_hours: map["GBHours"],
                    realtime: map["realtime"],
                    realtime_messages: map["realtimeMessages"],
                    messages: map["messages"],
                    topics: map["topics"],
                    auth_phone: map["authPhone"],
                    domains: map["domains"],
                    activity_logs: map["activityLogs"],
                    usage_logs: map["usageLogs"],
                    usage_logs_intervals: map["usageLogsIntervals"],
                    project_inactivity_days: map["projectInactivityDays"],
                    alert_limit: map["alertLimit"],
                    usage: UsageBillingPlan.from(map: map["usage"]),
                    addons: BillingPlanAddon.from(map: map["addons"]),
                    budget_cap_enabled: map["budgetCapEnabled"],
                    custom_smtp: map["customSmtp"],
                    email_branding: map["emailBranding"],
                    requires_payment_method: map["requiresPaymentMethod"],
                    requires_billing_address: map["requiresBillingAddress"],
                    is_available: map["isAvailable"],
                    self_service: map["selfService"],
                    premium_support: map["premiumSupport"],
                    budgeting: map["budgeting"],
                    supports_mock_numbers: map["supportsMockNumbers"],
                    supports_organization_roles: map["supportsOrganizationRoles"],
                    supports_credits: map["supportsCredits"],
                    supports_dedicated_databases: map["supportsDedicatedDatabases"],
                    supports_disposable_email_validation: map["supportsDisposableEmailValidation"],
                    supports_canonical_email_validation: map["supportsCanonicalEmailValidation"],
                    supports_free_email_validation: map["supportsFreeEmailValidation"],
                    supports_corporate_email_validation: map["supportsCorporateEmailValidation"],
                    supports_project_specific_roles: map["supportsProjectSpecificRoles"],
                    backups_enabled: map["backupsEnabled"],
                    usage_per_project: map["usagePerProject"],
                    supported_addons: BillingPlanSupportedAddons.from(map: map["supportedAddons"]),
                    backup_policies: map["backupPolicies"],
                    deployment_size: map["deploymentSize"],
                    build_size: map["buildSize"],
                    databases_allow_encrypt: map["databasesAllowEncrypt"],
                    limits: map["limits"].nil? ? nil : BillingPlanLimits.from(map: map["limits"]),
                    group: map["group"],
                    program: map["program"].nil? ? nil : Program.from(map: map["program"]),
                    database_compute_credit: map["databaseComputeCredit"],
                    dedicated_databases: map["dedicatedDatabases"].nil? ? nil : BillingPlanDedicatedDatabaseLimits.from(map: map["dedicatedDatabases"])
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "desc": @desc,
                    "order": @order,
                    "price": @price,
                    "trial": @trial,
                    "bandwidth": @bandwidth,
                    "storage": @storage,
                    "imageTransformations": @image_transformations,
                    "screenshotsGenerated": @screenshots_generated,
                    "members": @members,
                    "webhooks": @webhooks,
                    "wafRules": @waf_rules,
                    "projects": @projects,
                    "platforms": @platforms,
                    "users": @users,
                    "teams": @teams,
                    "databases": @databases,
                    "databasesReads": @databases_reads,
                    "databasesWrites": @databases_writes,
                    "databasesBatchSize": @databases_batch_size,
                    "buckets": @buckets,
                    "fileSize": @file_size,
                    "functions": @functions,
                    "sites": @sites,
                    "executions": @executions,
                    "executionsRetentionCount": @executions_retention_count,
                    "GBHours": @gb_hours,
                    "realtime": @realtime,
                    "realtimeMessages": @realtime_messages,
                    "messages": @messages,
                    "topics": @topics,
                    "authPhone": @auth_phone,
                    "domains": @domains,
                    "activityLogs": @activity_logs,
                    "usageLogs": @usage_logs,
                    "usageLogsIntervals": @usage_logs_intervals,
                    "projectInactivityDays": @project_inactivity_days,
                    "alertLimit": @alert_limit,
                    "usage": @usage.to_map,
                    "addons": @addons.to_map,
                    "budgetCapEnabled": @budget_cap_enabled,
                    "customSmtp": @custom_smtp,
                    "emailBranding": @email_branding,
                    "requiresPaymentMethod": @requires_payment_method,
                    "requiresBillingAddress": @requires_billing_address,
                    "isAvailable": @is_available,
                    "selfService": @self_service,
                    "premiumSupport": @premium_support,
                    "budgeting": @budgeting,
                    "supportsMockNumbers": @supports_mock_numbers,
                    "supportsOrganizationRoles": @supports_organization_roles,
                    "supportsCredits": @supports_credits,
                    "supportsDedicatedDatabases": @supports_dedicated_databases,
                    "supportsDisposableEmailValidation": @supports_disposable_email_validation,
                    "supportsCanonicalEmailValidation": @supports_canonical_email_validation,
                    "supportsFreeEmailValidation": @supports_free_email_validation,
                    "supportsCorporateEmailValidation": @supports_corporate_email_validation,
                    "supportsProjectSpecificRoles": @supports_project_specific_roles,
                    "backupsEnabled": @backups_enabled,
                    "usagePerProject": @usage_per_project,
                    "supportedAddons": @supported_addons.to_map,
                    "backupPolicies": @backup_policies,
                    "deploymentSize": @deployment_size,
                    "buildSize": @build_size,
                    "databasesAllowEncrypt": @databases_allow_encrypt,
                    "limits": @limits&.to_map,
                    "group": @group,
                    "program": @program&.to_map,
                    "databaseComputeCredit": @database_compute_credit,
                    "dedicatedDatabases": @dedicated_databases&.to_map
                }
            end

            private

            def validate_group(group)
                valid_group = [
                    Appwrite::Enums::BillingPlanGroup::STARTER,
                    Appwrite::Enums::BillingPlanGroup::PRO,
                    Appwrite::Enums::BillingPlanGroup::SCALE,
                ]

                unless valid_group.include?(group)
                    raise ArgumentError, "Invalid " + group + ". Must be one of: " + valid_group.join(', ')
                end

                group
            end
        end
    end
end
