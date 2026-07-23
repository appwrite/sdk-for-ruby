#frozen_string_literal: true

module Appwrite
    module Models
        class App
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :description
            attr_reader :client_uri
            attr_reader :logo_uri
            attr_reader :privacy_policy_url
            attr_reader :terms_url
            attr_reader :contacts
            attr_reader :tagline
            attr_reader :tags
            attr_reader :labels
            attr_reader :images
            attr_reader :support_url
            attr_reader :data_deletion_url
            attr_reader :redirect_uris
            attr_reader :post_logout_redirect_uris
            attr_reader :enabled
            attr_reader :type
            attr_reader :device_flow
            attr_reader :team_id
            attr_reader :user_id
            attr_reader :installation_scopes
            attr_reader :installation_redirect_url
            attr_reader :secrets

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                description:,
                client_uri:,
                logo_uri:,
                privacy_policy_url:,
                terms_url:,
                contacts:,
                tagline:,
                tags:,
                labels:,
                images:,
                support_url:,
                data_deletion_url:,
                redirect_uris:,
                post_logout_redirect_uris:,
                enabled:,
                type:,
                device_flow:,
                team_id:,
                user_id:,
                installation_scopes:,
                installation_redirect_url:,
                secrets:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @description = description
                @client_uri = client_uri
                @logo_uri = logo_uri
                @privacy_policy_url = privacy_policy_url
                @terms_url = terms_url
                @contacts = contacts
                @tagline = tagline
                @tags = tags
                @labels = labels
                @images = images
                @support_url = support_url
                @data_deletion_url = data_deletion_url
                @redirect_uris = redirect_uris
                @post_logout_redirect_uris = post_logout_redirect_uris
                @enabled = enabled
                @type = type
                @device_flow = device_flow
                @team_id = team_id
                @user_id = user_id
                @installation_scopes = installation_scopes
                @installation_redirect_url = installation_redirect_url
                @secrets = secrets
            end

            def self.from(map:)
                App.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    description: map["description"],
                    client_uri: map["clientUri"],
                    logo_uri: map["logoUri"],
                    privacy_policy_url: map["privacyPolicyUrl"],
                    terms_url: map["termsUrl"],
                    contacts: map["contacts"],
                    tagline: map["tagline"],
                    tags: map["tags"],
                    labels: map["labels"],
                    images: map["images"],
                    support_url: map["supportUrl"],
                    data_deletion_url: map["dataDeletionUrl"],
                    redirect_uris: map["redirectUris"],
                    post_logout_redirect_uris: map["postLogoutRedirectUris"],
                    enabled: map["enabled"],
                    type: map["type"],
                    device_flow: map["deviceFlow"],
                    team_id: map["teamId"],
                    user_id: map["userId"],
                    installation_scopes: map["installationScopes"],
                    installation_redirect_url: map["installationRedirectUrl"],
                    secrets: map["secrets"].map { |it| AppSecret.from(map: it) }
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "description": @description,
                    "clientUri": @client_uri,
                    "logoUri": @logo_uri,
                    "privacyPolicyUrl": @privacy_policy_url,
                    "termsUrl": @terms_url,
                    "contacts": @contacts,
                    "tagline": @tagline,
                    "tags": @tags,
                    "labels": @labels,
                    "images": @images,
                    "supportUrl": @support_url,
                    "dataDeletionUrl": @data_deletion_url,
                    "redirectUris": @redirect_uris,
                    "postLogoutRedirectUris": @post_logout_redirect_uris,
                    "enabled": @enabled,
                    "type": @type,
                    "deviceFlow": @device_flow,
                    "teamId": @team_id,
                    "userId": @user_id,
                    "installationScopes": @installation_scopes,
                    "installationRedirectUrl": @installation_redirect_url,
                    "secrets": @secrets.map { |it| it.to_map }
                }
            end
        end
    end
end
