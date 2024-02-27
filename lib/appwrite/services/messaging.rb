#frozen_string_literal: true

module Appwrite
    class Messaging < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all messages from the current Appwrite project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: scheduledAt, deliveredAt, deliveredTotal, status, description, providerType
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [MessageList]
        def list_messages(queries: nil, search: nil)
            api_path = '/messaging/messages'

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::MessageList            )
        end

        
        # Create a new email message.
        #
        # @param [String] message_id Message ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] subject Email Subject.
        # @param [String] content Email Content.
        # @param [Array] topics List of Topic IDs.
        # @param [Array] users List of User IDs.
        # @param [Array] targets List of Targets IDs.
        # @param [Array] cc Array of target IDs to be added as CC.
        # @param [Array] bcc Array of target IDs to be added as BCC.
        # @param [Array] attachments Array of compound bucket IDs to file IDs to be attached to the email.
        # @param [] draft Is message a draft
        # @param [] html Is content of type HTML
        # @param [String] scheduled_at Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.
        #
        # @return [Message]
        def create_email(message_id:, subject:, content:, topics: nil, users: nil, targets: nil, cc: nil, bcc: nil, attachments: nil, draft: nil, html: nil, scheduled_at: nil)
            api_path = '/messaging/messages/email'

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            if subject.nil?
              raise Appwrite::Exception.new('Missing required parameter: "subject"')
            end

            if content.nil?
              raise Appwrite::Exception.new('Missing required parameter: "content"')
            end

            api_params = {
                messageId: message_id,
                subject: subject,
                content: content,
                topics: topics,
                users: users,
                targets: targets,
                cc: cc,
                bcc: bcc,
                attachments: attachments,
                draft: draft,
                html: html,
                scheduledAt: scheduled_at,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Message            )
        end

        
        # Update an email message by its unique ID.
        # 
        #
        # @param [String] message_id Message ID.
        # @param [Array] topics List of Topic IDs.
        # @param [Array] users List of User IDs.
        # @param [Array] targets List of Targets IDs.
        # @param [String] subject Email Subject.
        # @param [String] content Email Content.
        # @param [] draft Is message a draft
        # @param [] html Is content of type HTML
        # @param [Array] cc Array of target IDs to be added as CC.
        # @param [Array] bcc Array of target IDs to be added as BCC.
        # @param [String] scheduled_at Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.
        #
        # @return [Message]
        def update_email(message_id:, topics: nil, users: nil, targets: nil, subject: nil, content: nil, draft: nil, html: nil, cc: nil, bcc: nil, scheduled_at: nil)
            api_path = '/messaging/messages/email/{messageId}'
                .gsub('{messageId}', message_id)

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            api_params = {
                topics: topics,
                users: users,
                targets: targets,
                subject: subject,
                content: content,
                draft: draft,
                html: html,
                cc: cc,
                bcc: bcc,
                scheduledAt: scheduled_at,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Message            )
        end

        
        # Create a new push notification.
        #
        # @param [String] message_id Message ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] title Title for push notification.
        # @param [String] body Body for push notification.
        # @param [Array] topics List of Topic IDs.
        # @param [Array] users List of User IDs.
        # @param [Array] targets List of Targets IDs.
        # @param [Hash] data Additional Data for push notification.
        # @param [String] action Action for push notification.
        # @param [String] image Image for push notification. Must be a compound bucket ID to file ID of a jpeg, png, or bmp image in Appwrite Storage.
        # @param [String] icon Icon for push notification. Available only for Android and Web Platform.
        # @param [String] sound Sound for push notification. Available only for Android and IOS Platform.
        # @param [String] color Color for push notification. Available only for Android Platform.
        # @param [String] tag Tag for push notification. Available only for Android Platform.
        # @param [String] badge Badge for push notification. Available only for IOS Platform.
        # @param [] draft Is message a draft
        # @param [String] scheduled_at Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.
        #
        # @return [Message]
        def create_push(message_id:, title:, body:, topics: nil, users: nil, targets: nil, data: nil, action: nil, image: nil, icon: nil, sound: nil, color: nil, tag: nil, badge: nil, draft: nil, scheduled_at: nil)
            api_path = '/messaging/messages/push'

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            if title.nil?
              raise Appwrite::Exception.new('Missing required parameter: "title"')
            end

            if body.nil?
              raise Appwrite::Exception.new('Missing required parameter: "body"')
            end

            api_params = {
                messageId: message_id,
                title: title,
                body: body,
                topics: topics,
                users: users,
                targets: targets,
                data: data,
                action: action,
                image: image,
                icon: icon,
                sound: sound,
                color: color,
                tag: tag,
                badge: badge,
                draft: draft,
                scheduledAt: scheduled_at,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Message            )
        end

        
        # Update a push notification by its unique ID.
        # 
        #
        # @param [String] message_id Message ID.
        # @param [Array] topics List of Topic IDs.
        # @param [Array] users List of User IDs.
        # @param [Array] targets List of Targets IDs.
        # @param [String] title Title for push notification.
        # @param [String] body Body for push notification.
        # @param [Hash] data Additional Data for push notification.
        # @param [String] action Action for push notification.
        # @param [String] image Image for push notification. Must be a compound bucket ID to file ID of a jpeg, png, or bmp image in Appwrite Storage.
        # @param [String] icon Icon for push notification. Available only for Android and Web platforms.
        # @param [String] sound Sound for push notification. Available only for Android and iOS platforms.
        # @param [String] color Color for push notification. Available only for Android platforms.
        # @param [String] tag Tag for push notification. Available only for Android platforms.
        # @param [Integer] badge Badge for push notification. Available only for iOS platforms.
        # @param [] draft Is message a draft
        # @param [String] scheduled_at Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.
        #
        # @return [Message]
        def update_push(message_id:, topics: nil, users: nil, targets: nil, title: nil, body: nil, data: nil, action: nil, image: nil, icon: nil, sound: nil, color: nil, tag: nil, badge: nil, draft: nil, scheduled_at: nil)
            api_path = '/messaging/messages/push/{messageId}'
                .gsub('{messageId}', message_id)

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            api_params = {
                topics: topics,
                users: users,
                targets: targets,
                title: title,
                body: body,
                data: data,
                action: action,
                image: image,
                icon: icon,
                sound: sound,
                color: color,
                tag: tag,
                badge: badge,
                draft: draft,
                scheduledAt: scheduled_at,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Message            )
        end

        
        # Create a new SMS message.
        #
        # @param [String] message_id Message ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] content SMS Content.
        # @param [Array] topics List of Topic IDs.
        # @param [Array] users List of User IDs.
        # @param [Array] targets List of Targets IDs.
        # @param [] draft Is message a draft
        # @param [String] scheduled_at Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.
        #
        # @return [Message]
        def create_sms(message_id:, content:, topics: nil, users: nil, targets: nil, draft: nil, scheduled_at: nil)
            api_path = '/messaging/messages/sms'

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            if content.nil?
              raise Appwrite::Exception.new('Missing required parameter: "content"')
            end

            api_params = {
                messageId: message_id,
                content: content,
                topics: topics,
                users: users,
                targets: targets,
                draft: draft,
                scheduledAt: scheduled_at,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Message            )
        end

        
        # Update an email message by its unique ID.
        # 
        #
        # @param [String] message_id Message ID.
        # @param [Array] topics List of Topic IDs.
        # @param [Array] users List of User IDs.
        # @param [Array] targets List of Targets IDs.
        # @param [String] content Email Content.
        # @param [] draft Is message a draft
        # @param [String] scheduled_at Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.
        #
        # @return [Message]
        def update_sms(message_id:, topics: nil, users: nil, targets: nil, content: nil, draft: nil, scheduled_at: nil)
            api_path = '/messaging/messages/sms/{messageId}'
                .gsub('{messageId}', message_id)

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            api_params = {
                topics: topics,
                users: users,
                targets: targets,
                content: content,
                draft: draft,
                scheduledAt: scheduled_at,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Message            )
        end

        
        # Get a message by its unique ID.
        # 
        #
        # @param [String] message_id Message ID.
        #
        # @return [Message]
        def get_message(message_id:)
            api_path = '/messaging/messages/{messageId}'
                .gsub('{messageId}', message_id)

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Message            )
        end

        
        # Delete a message. If the message is not a draft or scheduled, but has been
        # sent, this will not recall the message.
        #
        # @param [String] message_id Message ID.
        #
        # @return []
        def delete(message_id:)
            api_path = '/messaging/messages/{messageId}'
                .gsub('{messageId}', message_id)

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
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

        
        # Get the message activity logs listed by its unique ID.
        #
        # @param [String] message_id Message ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        #
        # @return [LogList]
        def list_message_logs(message_id:, queries: nil)
            api_path = '/messaging/messages/{messageId}/logs'
                .gsub('{messageId}', message_id)

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            api_params = {
                queries: queries,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::LogList            )
        end

        
        # Get a list of the targets associated with a message.
        #
        # @param [String] message_id Message ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, providerId, identifier, providerType
        #
        # @return [TargetList]
        def list_targets(message_id:, queries: nil)
            api_path = '/messaging/messages/{messageId}/targets'
                .gsub('{messageId}', message_id)

            if message_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "messageId"')
            end

            api_params = {
                queries: queries,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::TargetList            )
        end

        
        # Get a list of all providers from the current Appwrite project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, provider, type, enabled
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [ProviderList]
        def list_providers(queries: nil, search: nil)
            api_path = '/messaging/providers'

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProviderList            )
        end

        
        # Create a new Apple Push Notification service provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] auth_key APNS authentication key.
        # @param [String] auth_key_id APNS authentication key ID.
        # @param [String] team_id APNS team ID.
        # @param [String] bundle_id APNS bundle ID.
        # @param [] sandbox Use APNS sandbox environment.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_apns_provider(provider_id:, name:, auth_key: nil, auth_key_id: nil, team_id: nil, bundle_id: nil, sandbox: nil, enabled: nil)
            api_path = '/messaging/providers/apns'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                authKey: auth_key,
                authKeyId: auth_key_id,
                teamId: team_id,
                bundleId: bundle_id,
                sandbox: sandbox,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Apple Push Notification service provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [String] auth_key APNS authentication key.
        # @param [String] auth_key_id APNS authentication key ID.
        # @param [String] team_id APNS team ID.
        # @param [String] bundle_id APNS bundle ID.
        # @param [] sandbox Use APNS sandbox environment.
        #
        # @return [Provider]
        def update_apns_provider(provider_id:, name: nil, enabled: nil, auth_key: nil, auth_key_id: nil, team_id: nil, bundle_id: nil, sandbox: nil)
            api_path = '/messaging/providers/apns/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                authKey: auth_key,
                authKeyId: auth_key_id,
                teamId: team_id,
                bundleId: bundle_id,
                sandbox: sandbox,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new Firebase Cloud Messaging provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [Hash] service_account_json FCM service account JSON.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_fcm_provider(provider_id:, name:, service_account_json: nil, enabled: nil)
            api_path = '/messaging/providers/fcm'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                serviceAccountJSON: service_account_json,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Firebase Cloud Messaging provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [Hash] service_account_json FCM service account JSON.
        #
        # @return [Provider]
        def update_fcm_provider(provider_id:, name: nil, enabled: nil, service_account_json: nil)
            api_path = '/messaging/providers/fcm/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                serviceAccountJSON: service_account_json,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new Mailgun provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] api_key Mailgun API Key.
        # @param [String] domain Mailgun Domain.
        # @param [] is_eu_region Set as EU region.
        # @param [String] from_name Sender Name.
        # @param [String] from_email Sender email address.
        # @param [String] reply_to_name Name set in the reply to field for the mail. Default value is sender name. Reply to name must have reply to email as well.
        # @param [String] reply_to_email Email set in the reply to field for the mail. Default value is sender email. Reply to email must have reply to name as well.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_mailgun_provider(provider_id:, name:, api_key: nil, domain: nil, is_eu_region: nil, from_name: nil, from_email: nil, reply_to_name: nil, reply_to_email: nil, enabled: nil)
            api_path = '/messaging/providers/mailgun'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                apiKey: api_key,
                domain: domain,
                isEuRegion: is_eu_region,
                fromName: from_name,
                fromEmail: from_email,
                replyToName: reply_to_name,
                replyToEmail: reply_to_email,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Mailgun provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [String] api_key Mailgun API Key.
        # @param [String] domain Mailgun Domain.
        # @param [] is_eu_region Set as EU region.
        # @param [] enabled Set as enabled.
        # @param [String] from_name Sender Name.
        # @param [String] from_email Sender email address.
        # @param [String] reply_to_name Name set in the reply to field for the mail. Default value is sender name.
        # @param [String] reply_to_email Email set in the reply to field for the mail. Default value is sender email.
        #
        # @return [Provider]
        def update_mailgun_provider(provider_id:, name: nil, api_key: nil, domain: nil, is_eu_region: nil, enabled: nil, from_name: nil, from_email: nil, reply_to_name: nil, reply_to_email: nil)
            api_path = '/messaging/providers/mailgun/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                apiKey: api_key,
                domain: domain,
                isEuRegion: is_eu_region,
                enabled: enabled,
                fromName: from_name,
                fromEmail: from_email,
                replyToName: reply_to_name,
                replyToEmail: reply_to_email,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new MSG91 provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] from Sender Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] sender_id Msg91 Sender ID.
        # @param [String] auth_key Msg91 Auth Key.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_msg91_provider(provider_id:, name:, from: nil, sender_id: nil, auth_key: nil, enabled: nil)
            api_path = '/messaging/providers/msg91'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                from: from,
                senderId: sender_id,
                authKey: auth_key,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a MSG91 provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [String] sender_id Msg91 Sender ID.
        # @param [String] auth_key Msg91 Auth Key.
        # @param [String] from Sender number.
        #
        # @return [Provider]
        def update_msg91_provider(provider_id:, name: nil, enabled: nil, sender_id: nil, auth_key: nil, from: nil)
            api_path = '/messaging/providers/msg91/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                senderId: sender_id,
                authKey: auth_key,
                from: from,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new Sendgrid provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] api_key Sendgrid API key.
        # @param [String] from_name Sender Name.
        # @param [String] from_email Sender email address.
        # @param [String] reply_to_name Name set in the reply to field for the mail. Default value is sender name.
        # @param [String] reply_to_email Email set in the reply to field for the mail. Default value is sender email.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_sendgrid_provider(provider_id:, name:, api_key: nil, from_name: nil, from_email: nil, reply_to_name: nil, reply_to_email: nil, enabled: nil)
            api_path = '/messaging/providers/sendgrid'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                apiKey: api_key,
                fromName: from_name,
                fromEmail: from_email,
                replyToName: reply_to_name,
                replyToEmail: reply_to_email,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Sendgrid provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [String] api_key Sendgrid API key.
        # @param [String] from_name Sender Name.
        # @param [String] from_email Sender email address.
        # @param [String] reply_to_name Name set in the Reply To field for the mail. Default value is Sender Name.
        # @param [String] reply_to_email Email set in the Reply To field for the mail. Default value is Sender Email.
        #
        # @return [Provider]
        def update_sendgrid_provider(provider_id:, name: nil, enabled: nil, api_key: nil, from_name: nil, from_email: nil, reply_to_name: nil, reply_to_email: nil)
            api_path = '/messaging/providers/sendgrid/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                apiKey: api_key,
                fromName: from_name,
                fromEmail: from_email,
                replyToName: reply_to_name,
                replyToEmail: reply_to_email,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new SMTP provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] host SMTP hosts. Either a single hostname or multiple semicolon-delimited hostnames. You can also specify a different port for each host such as `smtp1.example.com:25;smtp2.example.com`. You can also specify encryption type, for example: `tls://smtp1.example.com:587;ssl://smtp2.example.com:465"`. Hosts will be tried in order.
        # @param [Integer] port The default SMTP server port.
        # @param [String] username Authentication username.
        # @param [String] password Authentication password.
        # @param [SmtpEncryption] encryption Encryption type. Can be omitted, 'ssl', or 'tls'
        # @param [] auto_tls Enable SMTP AutoTLS feature.
        # @param [String] mailer The value to use for the X-Mailer header.
        # @param [String] from_name Sender Name.
        # @param [String] from_email Sender email address.
        # @param [String] reply_to_name Name set in the reply to field for the mail. Default value is sender name.
        # @param [String] reply_to_email Email set in the reply to field for the mail. Default value is sender email.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_smtp_provider(provider_id:, name:, host:, port: nil, username: nil, password: nil, encryption: nil, auto_tls: nil, mailer: nil, from_name: nil, from_email: nil, reply_to_name: nil, reply_to_email: nil, enabled: nil)
            api_path = '/messaging/providers/smtp'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if host.nil?
              raise Appwrite::Exception.new('Missing required parameter: "host"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                host: host,
                port: port,
                username: username,
                password: password,
                encryption: encryption,
                autoTLS: auto_tls,
                mailer: mailer,
                fromName: from_name,
                fromEmail: from_email,
                replyToName: reply_to_name,
                replyToEmail: reply_to_email,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a SMTP provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [String] host SMTP hosts. Either a single hostname or multiple semicolon-delimited hostnames. You can also specify a different port for each host such as `smtp1.example.com:25;smtp2.example.com`. You can also specify encryption type, for example: `tls://smtp1.example.com:587;ssl://smtp2.example.com:465"`. Hosts will be tried in order.
        # @param [Integer] port SMTP port.
        # @param [String] username Authentication username.
        # @param [String] password Authentication password.
        # @param [SmtpEncryption] encryption Encryption type. Can be 'ssl' or 'tls'
        # @param [] auto_tls Enable SMTP AutoTLS feature.
        # @param [String] mailer The value to use for the X-Mailer header.
        # @param [String] from_name Sender Name.
        # @param [String] from_email Sender email address.
        # @param [String] reply_to_name Name set in the Reply To field for the mail. Default value is Sender Name.
        # @param [String] reply_to_email Email set in the Reply To field for the mail. Default value is Sender Email.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def update_smtp_provider(provider_id:, name: nil, host: nil, port: nil, username: nil, password: nil, encryption: nil, auto_tls: nil, mailer: nil, from_name: nil, from_email: nil, reply_to_name: nil, reply_to_email: nil, enabled: nil)
            api_path = '/messaging/providers/smtp/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                host: host,
                port: port,
                username: username,
                password: password,
                encryption: encryption,
                autoTLS: auto_tls,
                mailer: mailer,
                fromName: from_name,
                fromEmail: from_email,
                replyToName: reply_to_name,
                replyToEmail: reply_to_email,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new Telesign provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] from Sender Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] customer_id Telesign customer ID.
        # @param [String] api_key Telesign API key.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_telesign_provider(provider_id:, name:, from: nil, customer_id: nil, api_key: nil, enabled: nil)
            api_path = '/messaging/providers/telesign'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                from: from,
                customerId: customer_id,
                apiKey: api_key,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Telesign provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [String] customer_id Telesign customer ID.
        # @param [String] api_key Telesign API key.
        # @param [String] from Sender number.
        #
        # @return [Provider]
        def update_telesign_provider(provider_id:, name: nil, enabled: nil, customer_id: nil, api_key: nil, from: nil)
            api_path = '/messaging/providers/telesign/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                customerId: customer_id,
                apiKey: api_key,
                from: from,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new Textmagic provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] from Sender Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] username Textmagic username.
        # @param [String] api_key Textmagic apiKey.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_textmagic_provider(provider_id:, name:, from: nil, username: nil, api_key: nil, enabled: nil)
            api_path = '/messaging/providers/textmagic'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                from: from,
                username: username,
                apiKey: api_key,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Textmagic provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [String] username Textmagic username.
        # @param [String] api_key Textmagic apiKey.
        # @param [String] from Sender number.
        #
        # @return [Provider]
        def update_textmagic_provider(provider_id:, name: nil, enabled: nil, username: nil, api_key: nil, from: nil)
            api_path = '/messaging/providers/textmagic/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                username: username,
                apiKey: api_key,
                from: from,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new Twilio provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] from Sender Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] account_sid Twilio account secret ID.
        # @param [String] auth_token Twilio authentication token.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_twilio_provider(provider_id:, name:, from: nil, account_sid: nil, auth_token: nil, enabled: nil)
            api_path = '/messaging/providers/twilio'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                from: from,
                accountSid: account_sid,
                authToken: auth_token,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Twilio provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [String] account_sid Twilio account secret ID.
        # @param [String] auth_token Twilio authentication token.
        # @param [String] from Sender number.
        #
        # @return [Provider]
        def update_twilio_provider(provider_id:, name: nil, enabled: nil, account_sid: nil, auth_token: nil, from: nil)
            api_path = '/messaging/providers/twilio/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                accountSid: account_sid,
                authToken: auth_token,
                from: from,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Create a new Vonage provider.
        #
        # @param [String] provider_id Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Provider name.
        # @param [String] from Sender Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] api_key Vonage API key.
        # @param [String] api_secret Vonage API secret.
        # @param [] enabled Set as enabled.
        #
        # @return [Provider]
        def create_vonage_provider(provider_id:, name:, from: nil, api_key: nil, api_secret: nil, enabled: nil)
            api_path = '/messaging/providers/vonage'

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                providerId: provider_id,
                name: name,
                from: from,
                apiKey: api_key,
                apiSecret: api_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Update a Vonage provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [String] name Provider name.
        # @param [] enabled Set as enabled.
        # @param [String] api_key Vonage API key.
        # @param [String] api_secret Vonage API secret.
        # @param [String] from Sender number.
        #
        # @return [Provider]
        def update_vonage_provider(provider_id:, name: nil, enabled: nil, api_key: nil, api_secret: nil, from: nil)
            api_path = '/messaging/providers/vonage/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                name: name,
                enabled: enabled,
                apiKey: api_key,
                apiSecret: api_secret,
                from: from,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Get a provider by its unique ID.
        # 
        #
        # @param [String] provider_id Provider ID.
        #
        # @return [Provider]
        def get_provider(provider_id:)
            api_path = '/messaging/providers/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Provider            )
        end

        
        # Delete a provider by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        #
        # @return []
        def delete_provider(provider_id:)
            api_path = '/messaging/providers/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
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

        
        # Get the provider activity logs listed by its unique ID.
        #
        # @param [String] provider_id Provider ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        #
        # @return [LogList]
        def list_provider_logs(provider_id:, queries: nil)
            api_path = '/messaging/providers/{providerId}/logs'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
                queries: queries,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::LogList            )
        end

        
        # Get the subscriber activity logs listed by its unique ID.
        #
        # @param [String] subscriber_id Subscriber ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        #
        # @return [LogList]
        def list_subscriber_logs(subscriber_id:, queries: nil)
            api_path = '/messaging/subscribers/{subscriberId}/logs'
                .gsub('{subscriberId}', subscriber_id)

            if subscriber_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "subscriberId"')
            end

            api_params = {
                queries: queries,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::LogList            )
        end

        
        # Get a list of all topics from the current Appwrite project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, description, emailTotal, smsTotal, pushTotal
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [TopicList]
        def list_topics(queries: nil, search: nil)
            api_path = '/messaging/topics'

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::TopicList            )
        end

        
        # Create a new topic.
        #
        # @param [String] topic_id Topic ID. Choose a custom Topic ID or a new Topic ID.
        # @param [String] name Topic Name.
        # @param [Array] subscribe An array of role strings with subscribe permission. By default all users are granted with any subscribe permission. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.
        #
        # @return [Topic]
        def create_topic(topic_id:, name:, subscribe: nil)
            api_path = '/messaging/topics'

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                topicId: topic_id,
                name: name,
                subscribe: subscribe,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Topic            )
        end

        
        # Get a topic by its unique ID.
        # 
        #
        # @param [String] topic_id Topic ID.
        #
        # @return [Topic]
        def get_topic(topic_id:)
            api_path = '/messaging/topics/{topicId}'
                .gsub('{topicId}', topic_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Topic            )
        end

        
        # Update a topic by its unique ID.
        # 
        #
        # @param [String] topic_id Topic ID.
        # @param [String] name Topic Name.
        # @param [Array] subscribe An array of role strings with subscribe permission. By default all users are granted with any subscribe permission. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.
        #
        # @return [Topic]
        def update_topic(topic_id:, name: nil, subscribe: nil)
            api_path = '/messaging/topics/{topicId}'
                .gsub('{topicId}', topic_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            api_params = {
                name: name,
                subscribe: subscribe,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Topic            )
        end

        
        # Delete a topic by its unique ID.
        #
        # @param [String] topic_id Topic ID.
        #
        # @return []
        def delete_topic(topic_id:)
            api_path = '/messaging/topics/{topicId}'
                .gsub('{topicId}', topic_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
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

        
        # Get the topic activity logs listed by its unique ID.
        #
        # @param [String] topic_id Topic ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        #
        # @return [LogList]
        def list_topic_logs(topic_id:, queries: nil)
            api_path = '/messaging/topics/{topicId}/logs'
                .gsub('{topicId}', topic_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            api_params = {
                queries: queries,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::LogList            )
        end

        
        # Get a list of all subscribers from the current Appwrite project.
        #
        # @param [String] topic_id Topic ID. The topic ID subscribed to.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, provider, type, enabled
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [SubscriberList]
        def list_subscribers(topic_id:, queries: nil, search: nil)
            api_path = '/messaging/topics/{topicId}/subscribers'
                .gsub('{topicId}', topic_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::SubscriberList            )
        end

        
        # Create a new subscriber.
        #
        # @param [String] topic_id Topic ID. The topic ID to subscribe to.
        # @param [String] subscriber_id Subscriber ID. Choose a custom Subscriber ID or a new Subscriber ID.
        # @param [String] target_id Target ID. The target ID to link to the specified Topic ID.
        #
        # @return [Subscriber]
        def create_subscriber(topic_id:, subscriber_id:, target_id:)
            api_path = '/messaging/topics/{topicId}/subscribers'
                .gsub('{topicId}', topic_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            if subscriber_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "subscriberId"')
            end

            if target_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "targetId"')
            end

            api_params = {
                subscriberId: subscriber_id,
                targetId: target_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Subscriber            )
        end

        
        # Get a subscriber by its unique ID.
        # 
        #
        # @param [String] topic_id Topic ID. The topic ID subscribed to.
        # @param [String] subscriber_id Subscriber ID.
        #
        # @return [Subscriber]
        def get_subscriber(topic_id:, subscriber_id:)
            api_path = '/messaging/topics/{topicId}/subscribers/{subscriberId}'
                .gsub('{topicId}', topic_id)
                .gsub('{subscriberId}', subscriber_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            if subscriber_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "subscriberId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Subscriber            )
        end

        
        # Delete a subscriber by its unique ID.
        #
        # @param [String] topic_id Topic ID. The topic ID subscribed to.
        # @param [String] subscriber_id Subscriber ID.
        #
        # @return []
        def delete_subscriber(topic_id:, subscriber_id:)
            api_path = '/messaging/topics/{topicId}/subscribers/{subscriberId}'
                .gsub('{topicId}', topic_id)
                .gsub('{subscriberId}', subscriber_id)

            if topic_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "topicId"')
            end

            if subscriber_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "subscriberId"')
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

        
    end 
end