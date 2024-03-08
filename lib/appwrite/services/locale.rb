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
            api_path = '/locale'

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
                response_type: Models::Locale
            )
        end

        
        # List of all locale codes in [ISO
        # 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).
        #
        #
        # @return [LocaleCodeList]
        def list_codes()
            api_path = '/locale/codes'

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
                response_type: Models::LocaleCodeList
            )
        end

        
        # List of all continents. You can use the locale header to get the data in a
        # supported language.
        #
        #
        # @return [ContinentList]
        def list_continents()
            api_path = '/locale/continents'

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
                response_type: Models::ContinentList
            )
        end

        
        # List of all countries. You can use the locale header to get the data in a
        # supported language.
        #
        #
        # @return [CountryList]
        def list_countries()
            api_path = '/locale/countries'

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
                response_type: Models::CountryList
            )
        end

        
        # List of all countries that are currently members of the EU. You can use the
        # locale header to get the data in a supported language.
        #
        #
        # @return [CountryList]
        def list_countries_eu()
            api_path = '/locale/countries/eu'

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
                response_type: Models::CountryList
            )
        end

        
        # List of all countries phone codes. You can use the locale header to get the
        # data in a supported language.
        #
        #
        # @return [PhoneList]
        def list_countries_phones()
            api_path = '/locale/countries/phones'

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
                response_type: Models::PhoneList
            )
        end

        
        # List of all currencies, including currency symbol, name, plural, and
        # decimal digits for all major and minor currencies. You can use the locale
        # header to get the data in a supported language.
        #
        #
        # @return [CurrencyList]
        def list_currencies()
            api_path = '/locale/currencies'

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
                response_type: Models::CurrencyList
            )
        end

        
        # List of all languages classified by ISO 639-1 including 2-letter code, name
        # in English, and name in the respective language.
        #
        #
        # @return [LanguageList]
        def list_languages()
            api_path = '/locale/languages'

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
                response_type: Models::LanguageList
            )
        end

        
    end 
end