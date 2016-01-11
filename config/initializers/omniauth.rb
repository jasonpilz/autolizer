Rails.application.config.middleware.use OmniAuth::Builder do
  provider :automatic, ENV['AUTOMATIC_CLIENT_ID'],
                       ENV['AUTOMATIC_CLIENT_SECRET']
end
