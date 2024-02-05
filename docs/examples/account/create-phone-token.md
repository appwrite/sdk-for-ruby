require 'appwrite'

include Appwrite

client = Client.new
    .set_endpoint('https://cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('5df5acd0d48c2') # Your project ID

account = Account.new(client)

response = account.create_phone_token(user_id: '[USER_ID]', phone: '+12065550100')

puts response.inspect