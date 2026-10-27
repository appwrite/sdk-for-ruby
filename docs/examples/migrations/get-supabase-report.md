```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

migrations = Migrations.new(client)

result = migrations.get_supabase_report(
    resources: [SupabaseMigrationResource::USER],
    endpoint: 'https://example.com',
    api_key: '<API_KEY>',
    database_host: '<DATABASE_HOST>',
    username: '<USERNAME>',
    password: 'password',
    port: 5432 # optional
)
```
