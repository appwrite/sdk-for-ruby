#frozen_string_literal: true

module Appwrite
    class Health < Service

        include Models
        # Check the Appwrite HTTP server is up and responsive.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # Check the Appwrite Anti Virus server is up and connection is successful.
        #
        #
        # @return []
        def get_anti_virus()
            path = '/health/anti-virus'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
            )
        end

        # Check the Appwrite in-memory cache server is up and connection is
        # successful.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # Check the Appwrite database server is up and connection is successful.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # Get the number of certificates that are waiting to be issued against
        # [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue
        # server.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # 
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # Get the number of logs that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # Get the number of tasks that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        #
        # @return []
        def get_queue_tasks()
            path = '/health/queue/tasks'

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
            )
        end

        # Get the number of usage stats that are waiting to be processed in the
        # Appwrite internal queue server.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # Get the number of webhooks that are waiting to be processed in the Appwrite
        # internal queue server.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
            )
        end

        # Check the Appwrite local storage device is up and connection is successful.
        #
        #
        # @return []
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
                params: params,
                headers: headers,
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
        # @return []
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
                params: params,
                headers: headers,
            )
        end

    end 
end