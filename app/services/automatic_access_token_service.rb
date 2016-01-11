class AutomaticAccessTokenService
  # def initialize
  #   @connection = connection
  # end

  # def obtain_access_token(code)
  #   connection.post '/oauth/access_token', request_params(code)
  # end

  # def connection
  #   @connection ||= Faraday.new(:url => 'https://accounts.automatic.com')
  # end

  # def request_params(code)
  #   { :client_id     => ENV['AUTOMATIC_CLIENT_ID'],
  #     :client_secret => ENV['AUTOMATIC_CLIENT_SECRET'],
  #     :code          => code,
  #     :grant_type    => 'authorization_code' }
  # end
end
