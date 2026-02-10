#frozen_string_literal: true

module Appwrite
    class Organizations < Service

        def initialize(client)
            @client = client
        end

        # Delete an organization.
        #
        # @param [String] organization_id Team ID.
        #
        # @return []
        def delete(organization_id:)
            api_path = '/organizations/{organizationId}'
                .gsub('{organizationId}', organization_id)

            if organization_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "organizationId"')
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

        # Get estimation for deleting an organization.
        #
        # @param [String] organization_id Team ID.
        #
        # @return [EstimationDeleteOrganization]
        def estimation_delete_organization(organization_id:)
            api_path = '/organizations/{organizationId}/estimations/delete-organization'
                .gsub('{organizationId}', organization_id)

            if organization_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "organizationId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::EstimationDeleteOrganization
            )
        end

    end 
end