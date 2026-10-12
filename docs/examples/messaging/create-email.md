```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_key('<YOUR_API_KEY>') # Your secret API key

messaging = Messaging.new(client)

result = messaging.create_email(
    message_id: '<MESSAGE_ID>',
    subject: '<SUBJECT>',
    content: '<CONTENT>',
    topics: [], # optional
    users: [], # optional
    targets: [], # optional
    cc: [], # optional
    bcc: [], # optional
    attachments: [], # optional
    reply_to_email: 'email@example.com', # optional
    reply_to_name: '<REPLY_TO_NAME>', # optional
    draft: false, # optional
    html: false, # optional
    scheduled_at: '2020-10-15T06:38:00.000+00:00' # optional
)
```
