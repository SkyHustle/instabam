Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :instagram, ENV["instagram_id"], ENV["instagram_secret"]
end
