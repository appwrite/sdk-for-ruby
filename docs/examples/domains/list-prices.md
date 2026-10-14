```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

domains = Domains.new(client)

result = domains.list_prices(
    domains: [],
    period_years: null, # optional
    registration_type: DomainRegistrationType::NEW # optional
)
```
