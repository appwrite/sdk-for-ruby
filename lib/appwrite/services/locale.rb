#frozen_string_literal: true

module Appwrite
    class Locale < Service

        def initialize(client)
            @client = client
        end

        # Get the current user location based on IP. Returns an object with user
        # country code, country name, continent name, continent code, ip address and
        # suggested currency. You can use the locale header to get the data in a
        # supported language.
        # 
        # ([IP Geolocation by DB-IP](https://db-ip.com))
        #
        #
        # @return [Locale]
        def get()

            path = '/locale'

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
                response_type: Models::Locale
            )
        end

        
        # List of all continents. You can use the locale header to get the data in a
        # supported language.
        #
        #
        # @return [ContinentList]
        def get_continents()

            path = '/locale/continents'

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
                response_type: Models::ContinentList
            )
        end

        
        # List of all countries. You can use the locale header to get the data in a
        # supported language.
        #
        #
        # @return [CountryList]
        def get_countries()

            path = '/locale/countries'

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
                response_type: Models::CountryList
            )
        end

        
        # List of all countries that are currently members of the EU. You can use the
        # locale header to get the data in a supported language.
        #
        #
        # @return [CountryList]
        def get_countries_eu()

            path = '/locale/countries/eu'

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
                response_type: Models::CountryList
            )
        end

        
        # List of all countries phone codes. You can use the locale header to get the
        # data in a supported language.
        #
        #
        # @return [PhoneList]
        def get_countries_phones()

            path = '/locale/countries/phones'

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
                response_type: Models::PhoneList
            )
        end

        
        # List of all currencies, including currency symbol, name, plural, and
        # decimal digits for all major and minor currencies. You can use the locale
        # header to get the data in a supported language.
        #
        #
        # @return [CurrencyList]
        def get_currencies()

            path = '/locale/currencies'

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
                response_type: Models::CurrencyList
            )
        end

        
        # List of all languages classified by ISO 639-1 including 2-letter code, name
        # in English, and name in the respective language.
        #
        #
        # @return [LanguageList]
        def get_languages()

            path = '/locale/languages'

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
                response_type: Models::LanguageList
            )
        end

        
    end 
end