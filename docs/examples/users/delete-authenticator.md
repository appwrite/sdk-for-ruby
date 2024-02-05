require 'appwrite'

include Appwrite
include Appwrite::Enums

client = Client.new
    .set_endpoint('https://cloud.appwrite.io/v1') # Your API Endpoint
    .set_project('5df5acd0d48c2') # Your project ID
    .set_session('') # The user session to authenticate with

users = Users.new(client)

response = users.delete_authenticator(user_id: '[USER_ID]', provider: AuthenticatorProvider::TOTP, otp: '[OTP]')

puts response.inspect