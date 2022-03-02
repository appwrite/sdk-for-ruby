#frozen_string_literal: true

module Appwrite
    class Health < Service

        # Check the Appwrite HTTP server is up and responsive.
        #
        #
        # @return [HealthStatus]
        def get()
            path = '/health'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthStatus
            )
        end

        # Check the Appwrite Antivirus server is up and connection is successful.
        #
        #
        # @return [HealthAntivirus]
        def get_antivirus()
            path = '/health/anti-virus'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthAntivirus
            )
        end

        # Check the Appwrite in-memory cache server is up and connection is
        # successful.
        #
        #
        # @return [HealthStatus]
        def get_cache()
            path = '/health/cache'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthStatus
            )
        end

        # Check the Appwrite database server is up and connection is successful.
        #
        #
        # @return [HealthStatus]
        def get_db()
            path = '/health/db'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
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
            path = '/health/queue/certificates'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthQueue
            )
        end

        # 
        #
        #
        # @return [HealthQueue]
        def get_queue_functions()
            path = '/health/queue/functions'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthQueue
            )
        end

        # Get the number of logs that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        #
        # @return [HealthQueue]
        def get_queue_logs()
            path = '/health/queue/logs'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthQueue
            )
        end

        # Get the number of usage stats that are waiting to be processed in the
        # Appwrite internal queue server.
        #
        #
        # @return [HealthQueue]
        def get_queue_usage()
            path = '/health/queue/usage'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthQueue
            )
        end

        # Get the number of webhooks that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        #
        # @return [HealthQueue]
        def get_queue_webhooks()
            path = '/health/queue/webhooks'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthQueue
            )
        end

        # Check the Appwrite local storage device is up and connection is successful.
        #
        #
        # @return [HealthStatus]
        def get_storage_local()
            path = '/health/storage/local'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
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
            path = '/health/time'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::HealthTime
            )
        end

    end 
end