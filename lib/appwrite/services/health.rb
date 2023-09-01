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
                response_type: Models::HealthStatus
            )
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
                response_type: Models::HealthAntivirus
            )
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
                response_type: Models::HealthStatus
            )
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
                response_type: Models::HealthStatus
            )
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
                response_type: Models::HealthStatus
            )
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
                response_type: Models::HealthStatus
            )
        end

        
        # Get the number of certificates that are waiting to be issued against
        # [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue
        # server.
        #
        #
        # @return [HealthQueue]
        def get_queue_certificates()
            api_path = '/health/queue/certificates'

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
                response_type: Models::HealthQueue
            )
        end

        
        # 
        #
        #
        # @return [HealthQueue]
        def get_queue_functions()
            api_path = '/health/queue/functions'

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
                response_type: Models::HealthQueue
            )
        end

        
        # Get the number of logs that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        #
        # @return [HealthQueue]
        def get_queue_logs()
            api_path = '/health/queue/logs'

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
                response_type: Models::HealthQueue
            )
        end

        
        # Get the number of webhooks that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        #
        # @return [HealthQueue]
        def get_queue_webhooks()
            api_path = '/health/queue/webhooks'

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
                response_type: Models::HealthQueue
            )
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
                response_type: Models::HealthStatus
            )
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
                response_type: Models::HealthTime
            )
        end

        
    end 
end