```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

migrations = Migrations.new(client)

result = migrations.create_n_host_migration(
    resources: [NHostMigrationResource::USER],
    subdomain: '<SUBDOMAIN>',
    region: '<REGION>',
    admin_secret: '<ADMIN_SECRET>',
    database: '<DATABASE>',
    username: '<USERNAME>',
    password: 'password',
    port: 5432 # optional
)
```
