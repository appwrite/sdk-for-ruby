```ruby
require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

migrations = Migrations.new(client)

result = migrations.create_appwrite_migration(
    resources: [AppwriteMigrationResource::USER],
    endpoint: 'https://example.com',
    project_id: '<PROJECT_ID>',
    api_key: '<API_KEY>',
    on_duplicate: OnDuplicate::FAIL # optional
)
```
