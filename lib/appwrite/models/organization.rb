#frozen_string_literal: true

module Appwrite
    module Models
        class Organization
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :total
            attr_reader :prefs
            attr_reader :billing_budget
            attr_reader :budget_alerts
            attr_reader :billing_plan
            attr_reader :billing_plan_id
            attr_reader :billing_plan_details
            attr_reader :billing_email
            attr_reader :billing_start_date
            attr_reader :billing_current_invoice_date
            attr_reader :billing_next_invoice_date
            attr_reader :billing_trial_start_date
            attr_reader :billing_trial_days
            attr_reader :billing_aggregation_id
            attr_reader :billing_invoice_id
            attr_reader :payment_method_id
            attr_reader :billing_address_id
            attr_reader :backup_payment_method_id
            attr_reader :status
            attr_reader :remarks
            attr_reader :agreement_baa
            attr_reader :program_manager_name
            attr_reader :program_manager_calendar
            attr_reader :program_discord_channel_name
            attr_reader :program_discord_channel_url
            attr_reader :billing_limits
            attr_reader :billing_plan_downgrade
            attr_reader :billing_tax_id
            attr_reader :marked_for_deletion
            attr_reader :platform
            attr_reader :projects

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                total:,
                prefs:,
                billing_budget:,
                budget_alerts:,
                billing_plan:,
                billing_plan_id:,
                billing_plan_details:,
                billing_email:,
                billing_start_date:,
                billing_current_invoice_date:,
                billing_next_invoice_date:,
                billing_trial_start_date:,
                billing_trial_days:,
                billing_aggregation_id:,
                billing_invoice_id:,
                payment_method_id:,
                billing_address_id:,
                backup_payment_method_id:,
                status:,
                remarks:,
                agreement_baa:,
                program_manager_name:,
                program_manager_calendar:,
                program_discord_channel_name:,
                program_discord_channel_url:,
                billing_limits: ,
                billing_plan_downgrade:,
                billing_tax_id:,
                marked_for_deletion:,
                platform:,
                projects:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @total = total
                @prefs = prefs
                @billing_budget = billing_budget
                @budget_alerts = budget_alerts
                @billing_plan = billing_plan
                @billing_plan_id = billing_plan_id
                @billing_plan_details = billing_plan_details
                @billing_email = billing_email
                @billing_start_date = billing_start_date
                @billing_current_invoice_date = billing_current_invoice_date
                @billing_next_invoice_date = billing_next_invoice_date
                @billing_trial_start_date = billing_trial_start_date
                @billing_trial_days = billing_trial_days
                @billing_aggregation_id = billing_aggregation_id
                @billing_invoice_id = billing_invoice_id
                @payment_method_id = payment_method_id
                @billing_address_id = billing_address_id
                @backup_payment_method_id = backup_payment_method_id
                @status = status
                @remarks = remarks
                @agreement_baa = agreement_baa
                @program_manager_name = program_manager_name
                @program_manager_calendar = program_manager_calendar
                @program_discord_channel_name = program_discord_channel_name
                @program_discord_channel_url = program_discord_channel_url
                @billing_limits = billing_limits
                @billing_plan_downgrade = billing_plan_downgrade
                @billing_tax_id = billing_tax_id
                @marked_for_deletion = marked_for_deletion
                @platform = platform
                @projects = projects
            end

            def self.from(map:)
                Organization.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    total: map["total"],
                    prefs: Preferences.from(map: map["prefs"]),
                    billing_budget: map["billingBudget"],
                    budget_alerts: map["budgetAlerts"],
                    billing_plan: map["billingPlan"],
                    billing_plan_id: map["billingPlanId"],
                    billing_plan_details: BillingPlan.from(map: map["billingPlanDetails"]),
                    billing_email: map["billingEmail"],
                    billing_start_date: map["billingStartDate"],
                    billing_current_invoice_date: map["billingCurrentInvoiceDate"],
                    billing_next_invoice_date: map["billingNextInvoiceDate"],
                    billing_trial_start_date: map["billingTrialStartDate"],
                    billing_trial_days: map["billingTrialDays"],
                    billing_aggregation_id: map["billingAggregationId"],
                    billing_invoice_id: map["billingInvoiceId"],
                    payment_method_id: map["paymentMethodId"],
                    billing_address_id: map["billingAddressId"],
                    backup_payment_method_id: map["backupPaymentMethodId"],
                    status: map["status"],
                    remarks: map["remarks"],
                    agreement_baa: map["agreementBAA"],
                    program_manager_name: map["programManagerName"],
                    program_manager_calendar: map["programManagerCalendar"],
                    program_discord_channel_name: map["programDiscordChannelName"],
                    program_discord_channel_url: map["programDiscordChannelUrl"],
                    billing_limits: map["billingLimits"].nil? ? nil : BillingLimits.from(map: map["billingLimits"]),
                    billing_plan_downgrade: map["billingPlanDowngrade"],
                    billing_tax_id: map["billingTaxId"],
                    marked_for_deletion: map["markedForDeletion"],
                    platform: map["platform"],
                    projects: map["projects"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "total": @total,
                    "prefs": @prefs.to_map,
                    "billingBudget": @billing_budget,
                    "budgetAlerts": @budget_alerts,
                    "billingPlan": @billing_plan,
                    "billingPlanId": @billing_plan_id,
                    "billingPlanDetails": @billing_plan_details.to_map,
                    "billingEmail": @billing_email,
                    "billingStartDate": @billing_start_date,
                    "billingCurrentInvoiceDate": @billing_current_invoice_date,
                    "billingNextInvoiceDate": @billing_next_invoice_date,
                    "billingTrialStartDate": @billing_trial_start_date,
                    "billingTrialDays": @billing_trial_days,
                    "billingAggregationId": @billing_aggregation_id,
                    "billingInvoiceId": @billing_invoice_id,
                    "paymentMethodId": @payment_method_id,
                    "billingAddressId": @billing_address_id,
                    "backupPaymentMethodId": @backup_payment_method_id,
                    "status": @status,
                    "remarks": @remarks,
                    "agreementBAA": @agreement_baa,
                    "programManagerName": @program_manager_name,
                    "programManagerCalendar": @program_manager_calendar,
                    "programDiscordChannelName": @program_discord_channel_name,
                    "programDiscordChannelUrl": @program_discord_channel_url,
                    "billingLimits": @billing_limits&.to_map,
                    "billingPlanDowngrade": @billing_plan_downgrade,
                    "billingTaxId": @billing_tax_id,
                    "markedForDeletion": @marked_for_deletion,
                    "platform": @platform,
                    "projects": @projects
                }
            end
        end
    end
end
