```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

videos = Videos.new(client)

result = videos.create_caption(
    video_id: '<VIDEO_ID>',
    bucket_id: '<BUCKET_ID>',
    file_id: '<FILE_ID>',
    name: '<NAME>',
    language: 'aar',
    default: false # optional
)
```
