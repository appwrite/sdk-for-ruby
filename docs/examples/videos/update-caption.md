```ruby
require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('<YOUR_PROJECT_ID>') # Your project ID
    .set_session('') # The user session to authenticate with

videos = Videos.new(client)

result = videos.update_caption(
    video_id: '<VIDEO_ID>',
    caption_id: '<CAPTION_ID>',
    bucket_id: '<BUCKET_ID>', # optional
    file_id: '<FILE_ID>', # optional
    name: '<NAME>', # optional
    language: 'aar', # optional
    default: false # optional
)
```
