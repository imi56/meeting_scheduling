module AuthHelper
  require 'jwt_auth_token'
  def get_token_data(data_to_be_encoded={})
    data = {}
    token = JwtAuthToken.encode(data_to_be_encoded)
    data[:auth_token] = token
    data[:expiry] = JwtAuthToken::Constants::DEFAULT_TTL
    data
  end
end