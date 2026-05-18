#frozen_string_literal: true

module Appwrite
    class Advisor < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the project's analyzer reports. You can use the query
        # params to filter your results.
        # 
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: appId, type, targetType, target, analyzedAt
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [ReportList]
        def list_reports(queries: nil, total: nil)
            api_path = '/reports'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ReportList
            )

        end

        # Get an analyzer report by its unique ID. The response includes the report's
        # metadata and the nested insights it produced.
        # 
        #
        # @param [String] report_id Report ID.
        #
        # @return [Report]
        def get_report(report_id:)
            api_path = '/reports/{reportId}'
                .gsub('{reportId}', report_id)

            if report_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "reportId"')
            end

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Report
            )

        end

        # Delete an analyzer report by its unique ID. Nested insights and CTA
        # metadata are removed asynchronously by the deletes worker.
        # 
        #
        # @param [String] report_id Report ID.
        #
        # @return []
        def delete_report(report_id:)
            api_path = '/reports/{reportId}'
                .gsub('{reportId}', report_id)

            if report_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "reportId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # List the insights produced under a single analyzer report. You can use the
        # query params to filter your results further.
        # 
        #
        # @param [String] report_id Parent report ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: type, severity, status, resourceType, resourceId, parentResourceType, parentResourceId, analyzedAt, dismissedAt, dismissedBy
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [InsightList]
        def list_insights(report_id:, queries: nil, total: nil)
            api_path = '/reports/{reportId}/insights'
                .gsub('{reportId}', report_id)

            if report_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "reportId"')
            end

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::InsightList
            )

        end

        # Get an insight by its unique ID, scoped to its parent report.
        # 
        #
        # @param [String] report_id Parent report ID.
        # @param [String] insight_id Insight ID.
        #
        # @return [Insight]
        def get_insight(report_id:, insight_id:)
            api_path = '/reports/{reportId}/insights/{insightId}'
                .gsub('{reportId}', report_id)
                .gsub('{insightId}', insight_id)

            if report_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "reportId"')
            end

            if insight_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "insightId"')
            end

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Insight
            )

        end

    end 
end
