#frozen_string_literal: true

module Appwrite
    class Health < Service

        def initialize(client)
            @client = client
        end

        # Check the Appwrite HTTP server is up and responsive.
        #
        #
        # @return [HealthStatus]
        def get()
            api_path = '/health'

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
                response_type: Models::HealthStatus            )
        end

        
        # Check the Appwrite Antivirus server is up and connection is successful.
        #
        #
        # @return [HealthAntivirus]
        def get_antivirus()
            api_path = '/health/anti-virus'

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
                response_type: Models::HealthAntivirus            )
        end

        
        # Check the Appwrite in-memory cache servers are up and connection is
        # successful.
        #
        #
        # @return [HealthStatus]
        def get_cache()
            api_path = '/health/cache'

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
                response_type: Models::HealthStatus            )
        end

        
        # Get the SSL certificate for a domain
        #
        # @param [String] domain string
        #
        # @return [HealthCertificate]
        def get_certificate(domain: nil)
            api_path = '/health/certificate'

            api_params = {
                domain: domain,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthCertificate            )
        end

        
        # Check the Appwrite database servers are up and connection is successful.
        #
        #
        # @return [HealthStatus]
        def get_db()
            api_path = '/health/db'

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
                response_type: Models::HealthStatus            )
        end

        
        # Check the Appwrite pub-sub servers are up and connection is successful.
        #
        #
        # @return [HealthStatus]
        def get_pub_sub()
            api_path = '/health/pubsub'

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
                response_type: Models::HealthStatus            )
        end

        
        # Check the Appwrite queue messaging servers are up and connection is
        # successful.
        #
        #
        # @return [HealthStatus]
        def get_queue()
            api_path = '/health/queue'

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
                response_type: Models::HealthStatus            )
        end

        
        # Get the number of builds that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_builds(threshold: nil)
            api_path = '/health/queue/builds'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of certificates that are waiting to be issued against
        # [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue
        # server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_certificates(threshold: nil)
            api_path = '/health/queue/certificates'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of database changes that are waiting to be processed in the
        # Appwrite internal queue server.
        #
        # @param [String] name Queue name for which to check the queue size
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_databases(name: nil, threshold: nil)
            api_path = '/health/queue/databases'

            api_params = {
                name: name,
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of background destructive changes that are waiting to be
        # processed in the Appwrite internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_deletes(threshold: nil)
            api_path = '/health/queue/deletes'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Returns the amount of failed jobs in a given queue.
        # 
        #
        # @param [Name] name The name of the queue
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_failed_jobs(name:, threshold: nil)
            api_path = '/health/queue/failed/{name}'
                .gsub('{name}', name)

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of function executions that are waiting to be processed in
        # the Appwrite internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_functions(threshold: nil)
            api_path = '/health/queue/functions'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of logs that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_logs(threshold: nil)
            api_path = '/health/queue/logs'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of mails that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_mails(threshold: nil)
            api_path = '/health/queue/mails'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of messages that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_messaging(threshold: nil)
            api_path = '/health/queue/messaging'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of migrations that are waiting to be processed in the
        # Appwrite internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_migrations(threshold: nil)
            api_path = '/health/queue/migrations'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of metrics that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_usage(threshold: nil)
            api_path = '/health/queue/usage'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of projects containing metrics that are waiting to be
        # processed in the Appwrite internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_usage(threshold: nil)
            api_path = '/health/queue/usage-dump'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Get the number of webhooks that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        # @param [Integer] threshold Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.
        #
        # @return [HealthQueue]
        def get_queue_webhooks(threshold: nil)
            api_path = '/health/queue/webhooks'

            api_params = {
                threshold: threshold,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::HealthQueue            )
        end

        
        # Check the Appwrite storage device is up and connection is successful.
        #
        #
        # @return [HealthStatus]
        def get_storage()
            api_path = '/health/storage'

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
                response_type: Models::HealthStatus            )
        end

        
        # Check the Appwrite local storage device is up and connection is successful.
        #
        #
        # @return [HealthStatus]
        def get_storage_local()
            api_path = '/health/storage/local'

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
                response_type: Models::HealthStatus            )
        end

        
        # Check the Appwrite server time is synced with Google remote NTP server. We
        # use this technology to smoothly handle leap seconds with no disruptive
        # events. The [Network Time
        # Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol) (NTP) is
        # used by hundreds of millions of computers and devices to synchronize their
        # clocks over the Internet. If your computer sets its own clock, it likely
        # uses NTP.
        #
        #
        # @return [HealthTime]
        def get_time()
            api_path = '/health/time'

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
                response_type: Models::HealthTime            )
        end

        
    end 
end