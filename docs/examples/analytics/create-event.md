```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

analytics = Analytics.new(client)

result = analytics.create_event(
    property_id: '<PROPERTY_ID>',
    name: '<NAME>',
    url: 'https://example.com',
    domain: '<DOMAIN>', # optional
    referrer: '<REFERRER>', # optional
    screen_width: nil, # optional
    session_hash: '<SESSION_HASH>', # optional
    scroll_depth: 0, # optional
    engagement_time: 0, # optional
    props: [], # optional
    user_id: '<USER_ID>', # optional
    ip: '<IP>', # optional
    user_agent: '<USER_AGENT>', # optional
    interactive: false # optional
)
```
