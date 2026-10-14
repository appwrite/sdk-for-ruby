# frozen_string_literal: true

module Appwrite
    class Domains < Service
        def initialize(client)
            @client = client
        end

        # List all domains registered for this project. This endpoint supports
        # pagination.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on attributes such as domain name, teamInternalId, expiration, etc.
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [DomainsList]
        def list(
            queries: nil,
            search: nil
        )
            api_path = '/domains'

            api_params = {
                queries: queries,
                search: search,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DomainsList
            )
        end

        # Create a new domain. Before creating a domain, you need to ensure that your
        # DNS provider is properly configured. After creating the domain, you can use
        # the verification endpoint to check if the domain is ready to be used.
        #
        # @param [String] team_id Team unique ID.
        # @param [String] domain Domain name (e.g. &quot;example.com&quot;).
        #
        # @return [Domain]
        def create(
            team_id:,
            domain:
        )
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if domain.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            api_path = '/domains'

            api_params = {
                teamId: team_id,
                domain: domain,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Domain
            )
        end

        #
        # @deprecated This API has been deprecated since 2.0.0. Please use `Domains.listPrices` instead.
        #
        # Get the registration price for a domain name.
        #
        # @param [String] domain Domain name to get price for.
        # @param [Integer] period_years Number of years to calculate the domain price for. Must be at least 1.
        # @param [DomainRegistrationType] registration_type Type of registration pricing to fetch. Allowed values: new, transfer, renewal, trade.
        #
        # @return [DomainPrice]
        def get_price(
            domain:,
            period_years: nil,
            registration_type: nil
        )
            if domain.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            api_path = '/domains/price'

            api_params = {
                domain: domain,
                periodYears: period_years,
                registrationType: registration_type,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DomainPrice
            )
        end

        # Check availability and get the requested registration price for one or more
        # domain names. Availability is resolved for all domains in a single
        # registrar lookup. Unavailable domains have a null price for new
        # registrations, but can still be priced for renewal, transfer, or trade.
        # Every priced domain also carries its renewal price for the same period, so
        # a separate renewal lookup is not needed. A domain whose price could not be
        # resolved, for example because its TLD is not supported, is returned with a
        # null price.
        #
        # @param [Array] domains Domain names to check availability and price for. Maximum of 50 domains per request.
        # @param [Integer] period_years Number of years to calculate the domain price for. Must be at least 1.
        # @param [DomainRegistrationType] registration_type Type of registration pricing to fetch. Allowed values: new, transfer, renewal, trade.
        #
        # @return [DomainPricesList]
        def list_prices(
            domains:,
            period_years: nil,
            registration_type: nil
        )
            if domains.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domains"')
            end

            api_path = '/domains/prices'

            api_params = {
                domains: domains,
                periodYears: period_years,
                registrationType: registration_type,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DomainPricesList
            )
        end

        # Get a domain by its unique ID.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [Domain]
        def get(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Domain
            )
        end

        # Delete a domain by its unique ID. This endpoint can be used to delete a
        # domain from your project.
        # Once deleted, the domain will no longer be available for use and all
        # associated resources will be removed.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return []
        def delete(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Update the registrar nameservers for the given domain. When nameservers are
        # not provided,
        # the domain will be updated to use Appwrite nameservers.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [Array] nameservers Nameservers to set for the domain. Defaults to Appwrite nameservers when omitted.
        #
        # @return [Domain]
        def update_nameservers(
            domain_id:,
            nameservers: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/nameservers'
                .gsub('{domainId}', domain_id)

            api_params = {
                nameservers: nameservers,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Domain
            )
        end

        # Verify which NS records are used and update the domain accordingly. This
        # will check the domain&#039;s
        # nameservers and update the domain&#039;s status based on whether the nameservers
        # match the expected
        # Appwrite nameservers.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [Domain]
        def verify_nameservers(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/nameservers/verification'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Domain
            )
        end

        # List Google Workspace DNS records.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def get_preset_google_workspace(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/google-workspace'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # Add Google Workspace DNS records to the domain. This will create the
        # required MX records
        # for Google Workspace email hosting.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def create_preset_google_workspace(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/google-workspace'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # List iCloud DNS records.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def get_preset_i_cloud(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/icloud'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # Add iCloud DNS records to the domain. This will create the required MX and
        # SPF records
        # for using iCloud email services with your domain.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def create_preset_i_cloud(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/icloud'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # List Mailgun DNS records.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def get_preset_mailgun(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/mailgun'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # Add Mailgun DNS records to the domain. This endpoint will create the
        # required DNS records
        # for Mailgun in the specified domain.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def create_preset_mailgun(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/mailgun'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # List Outlook DNS records.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def get_preset_outlook(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/outlook'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # Add Outlook DNS records to the domain. This will create the required MX
        # records
        # for setting up Outlook email hosting for your domain.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def create_preset_outlook(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/outlook'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # List ProtonMail DNS records.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def get_preset_proton_mail(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/proton-mail'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # Add ProtonMail DNS records to the domain. This will create the required MX
        # records
        # for using ProtonMail with your custom domain.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def create_preset_proton_mail(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/proton-mail'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # List Zoho DNS records.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def get_preset_zoho(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/zoho'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # Add Zoho Mail DNS records to the domain. This will create the required MX
        # records
        # for setting up Zoho Mail on your domain.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DnsRecordsList]
        def create_preset_zoho(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/presets/zoho'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # List DNS records for a given domain. You can use this endpoint to list all
        # the DNS records
        # associated with your domain.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. You may filter on attributes such as type, name, value, etc. Maximum of 100 queries are allowed, each 4096 characters long.
        #
        # @return [DnsRecordsList]
        def list_records(
            domain_id:,
            queries: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/records'
                .gsub('{domainId}', domain_id)

            api_params = {
                queries: queries,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecordsList
            )
        end

        # Create a new A record for the given domain. A records are used to point a
        # domain name
        # to an IPv4 address. The record value should be a valid IPv4 address.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value IPv4 address for this A record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment explaining what this record is for.
        #
        # @return [DnsRecord]
        def create_record_a(
            domain_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/a'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing A record for the given domain. This endpoint allows you
        # to modify
        # the properties of an A record including its name (subdomain), IPv4 address,
        # TTL,
        # and optional comment.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value IPv4 address for this A record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment explaining what this record is for.
        #
        # @return [DnsRecord]
        def update_record_a(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/a/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new AAAA record for the given domain. This endpoint allows you to
        # add a new IPv6 DNS record
        # to your domain. The record will be used to point a hostname to an IPv6
        # address.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value IPv6 address for this AAAA record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment explaining what this record is for.
        #
        # @return [DnsRecord]
        def create_record_aaaa(
            domain_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/aaaa'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing AAAA record for the given domain. This endpoint allows
        # you to modify
        # the properties of an existing AAAA record, including its name (subdomain),
        # IPv6 address,
        # TTL, and optional comment.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value IPv6 address for this AAAA record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_aaaa(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/aaaa/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new ALIAS record for the given domain. This record type can be
        # used to point your domain
        # to another domain name that will serve as an alias. This is particularly
        # useful when you want to
        # map your domain to a target domain that may change its IP address.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name.
        # @param [String] value Target domain for this ALIAS record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_alias(
            domain_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/alias'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing ALIAS record for the specified domain. This endpoint
        # allows you to modify
        # the properties of an existing ALIAS record including its name, target
        # domain, TTL, and comment.
        #
        # The ALIAS record type is similar to a CNAME record but can be used at the
        # zone apex (root domain).
        # It provides a way to map one domain name to another.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name.
        # @param [String] value Target domain for this ALIAS record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_alias(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/alias/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new CAA record for the given domain. CAA records are used to
        # specify which
        # Certificate Authorities (CAs) are allowed to issue SSL/TLS certificates for
        # your domain.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name.
        # @param [String] value CAA value (e.g. issuer domain).
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_caa(
            domain_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/caa'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing CAA record for the given domain. A CAA (Certification
        # Authority Authorization)
        # record is used to specify which certificate authorities (CAs) are
        # authorized to issue certificates
        # for a domain.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name.
        # @param [String] value CAA value (e.g. issuer domain).
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_caa(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/caa/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new CNAME record for the given domain.
        #
        # A CNAME record maps a subdomain to another domain name, allowing you to
        # create aliases
        # for your domain. For example, you can create a CNAME record to point
        # &#039;blog.example.com&#039;
        # to &#039;example.wordpress.com&#039;.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Canonical target for this CNAME record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_cname(
            domain_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/cname'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing CNAME record for the given domain.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Canonical target for this CNAME record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_cname(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/cname/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new HTTPS record for the given domain. This record is used to
        # configure HTTPS
        # settings for your domain, enabling secure communication over SSL/TLS.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Target for the HTTPS record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_https(
            domain_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/https'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing HTTPS record for the given domain. This endpoint allows
        # you to modify
        # the properties of an HTTPS record associated with your domain, including
        # the name (subdomain),
        # target value, TTL, and optional comment.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Target for the HTTPS record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_https(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/https/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new MX record for the given domain. MX records are used to define
        # the mail servers responsible
        # for accepting email messages for the domain. Multiple MX records can be
        # created with different priorities.
        # The priority parameter determines the order in which mail servers are used,
        # with lower values indicating
        # higher priority.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Mail server domain for this MX record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [Integer] priority MX priority. Lower values are tried first.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_mx(
            domain_id:,
            name:,
            value:,
            ttl:,
            priority:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            if priority.nil?
                raise Appwrite::Exception.new('Missing required parameter: "priority"')
            end

            api_path = '/domains/{domainId}/records/mx'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                priority: priority,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing MX record for the given domain.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Mail server domain for this MX record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [Integer] priority MX priority. Lower values are tried first.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_mx(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            priority:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            if priority.nil?
                raise Appwrite::Exception.new('Missing required parameter: "priority"')
            end

            api_path = '/domains/{domainId}/records/mx/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                priority: priority,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new NS record for the given domain. NS records specify the
        # nameservers that are used
        # to resolve the domain name to IP addresses. Each domain can have multiple
        # NS records.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Nameserver target for this NS record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_ns(
            domain_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/ns'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing NS record for the given domain. This endpoint allows you
        # to modify
        # the properties of an NS (nameserver) record associated with your domain.
        # You can update
        # the record name (subdomain), target nameserver value, TTL, and add or
        # modify comments
        # for better record management.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (subdomain).
        # @param [String] value Nameserver target for this NS record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_ns(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/ns/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new SRV record for the given domain. SRV records are used to
        # define the location
        # of servers for specific services. For example, they can be used to specify
        # which server
        # handles a specific service like SIP or XMPP for the domain.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (service name).
        # @param [String] value Target hostname for this SRV record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [Integer] priority Record priority. Lower values are tried first.
        # @param [Integer] weight Record weight, used to share load between targets of equal priority.
        # @param [Integer] port Port number for the service.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_srv(
            domain_id:,
            name:,
            value:,
            ttl:,
            priority:,
            weight:,
            port:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            if priority.nil?
                raise Appwrite::Exception.new('Missing required parameter: "priority"')
            end

            if weight.nil?
                raise Appwrite::Exception.new('Missing required parameter: "weight"')
            end

            if port.nil?
                raise Appwrite::Exception.new('Missing required parameter: "port"')
            end

            api_path = '/domains/{domainId}/records/srv'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                priority: priority,
                weight: weight,
                port: port,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing SRV record for the given domain.
        #
        # Required parameters:
        # - domainId: Domain unique ID
        # - recordId: DNS record unique ID
        # - name: Record name (service name)
        # - value: Target hostname for this SRV record
        # - ttl: Time to live, in seconds
        # - priority: Record priority
        # - weight: Record weight
        # - port: Port number for the service
        #
        # Optional parameters:
        # - comment: A comment for this record
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (service name).
        # @param [String] value Target hostname for this SRV record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [Integer] priority Record priority. Lower values are tried first.
        # @param [Integer] weight Record weight, used to share load between targets of equal priority.
        # @param [Integer] port Port number for the service.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_srv(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            priority:,
            weight:,
            port:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            if priority.nil?
                raise Appwrite::Exception.new('Missing required parameter: "priority"')
            end

            if weight.nil?
                raise Appwrite::Exception.new('Missing required parameter: "weight"')
            end

            if port.nil?
                raise Appwrite::Exception.new('Missing required parameter: "port"')
            end

            api_path = '/domains/{domainId}/records/srv/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                priority: priority,
                weight: weight,
                port: port,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Create a new TXT record for the given domain. TXT records can be used
        # to provide additional information about your domain, such as domain
        # verification records, SPF records, or DKIM records.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] name Record name (subdomain) for the TXT record.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] value TXT record value.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def create_record_txt(
            domain_id:,
            name:,
            ttl:,
            value: nil,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/txt'
                .gsub('{domainId}', domain_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Update an existing TXT record for the given domain.
        #
        # Update the TXT record details for a specific domain by providing the domain
        # ID,
        # record ID, and the new record configuration including name, value, TTL, and
        # an optional comment.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        # @param [String] name Record name (subdomain) for the TXT record.
        # @param [String] value TXT record value.
        # @param [Integer] ttl Time to live, in seconds. Must be between 1 and 2147483647.
        # @param [String] comment A comment for this record.
        #
        # @return [DnsRecord]
        def update_record_txt(
            domain_id:,
            record_id:,
            name:,
            value:,
            ttl:,
            comment: nil
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if value.nil?
                raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            if ttl.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ttl"')
            end

            api_path = '/domains/{domainId}/records/txt/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {
                name: name,
                value: value,
                ttl: ttl,
                comment: comment,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Get a single DNS record for a given domain by record ID.
        #
        # This endpoint allows you to retrieve a specific DNS record associated with
        # a domain
        # using its unique identifier. The record contains information about the DNS
        # configuration
        # such as type, value, and TTL settings.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        #
        # @return [DnsRecord]
        def get_record(
            domain_id:,
            record_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            api_path = '/domains/{domainId}/records/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DnsRecord
            )
        end

        # Delete a DNS record for the given domain. This endpoint allows you to
        # delete an existing DNS record
        # from a specific domain.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] record_id DNS record unique ID.
        #
        # @return []
        def delete_record(
            domain_id:,
            record_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if record_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "recordId"')
            end

            api_path = '/domains/{domainId}/records/{recordId}'
                .gsub('{domainId}', domain_id)
                .gsub('{recordId}', record_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Update the team ID for a specific domain. The caller must administer the
        # current
        # team and be an owner of the destination team.
        #
        # Updating the team ID will transfer ownership and access control of the
        # domain
        # and all its DNS records to the new team.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] team_id New team unique ID.
        #
        # @return [Domain]
        def update_team(
            domain_id:,
            team_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            api_path = '/domains/{domainId}/team'
                .gsub('{domainId}', domain_id)

            api_params = {
                teamId: team_id,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Domain
            )
        end

        # Retrieve the current transfer status for a domain. Returns the status, an
        # optional reason, and a timestamp of the last status change.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [DomainTransferStatus]
        def get_transfer_status(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/transfers/status'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DomainTransferStatus
            )
        end

        # Retrieve the DNS zone file for the given domain. This endpoint will return
        # the DNS
        # zone file in a standardized format that can be used to configure DNS
        # servers.
        #
        # @param [String] domain_id Domain unique ID.
        #
        # @return [String]
        def get_zone(
            domain_id:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            api_path = '/domains/{domainId}/zone'
                .gsub('{domainId}', domain_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'text/plain',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: "text"
            )
        end

        # Update the DNS zone for the given domain using the provided zone file
        # content.
        # All parsed records are imported and then the main domain document is
        # returned.
        #
        # @param [String] domain_id Domain unique ID.
        # @param [String] content DNS zone file content as a string.
        #
        # @return [Domain]
        def update_zone(
            domain_id:,
            content:
        )
            if domain_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domainId"')
            end

            if content.nil?
                raise Appwrite::Exception.new('Missing required parameter: "content"')
            end

            api_path = '/domains/{domainId}/zone'
                .gsub('{domainId}', domain_id)

            api_params = {
                content: content,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Domain
            )
        end
    end
end
