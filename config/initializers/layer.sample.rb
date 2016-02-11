Layer::Client.configure do |config|
  config.app_id = 'layer:///apps/staging/my-app-id'
  config.token = 'H6EvCKXyPpXuQtBDU07TdgLguNMatEQcOKBmQqpJTVsg5Gdj'
end

Layer::IdentityToken.layer_provider_id = 'layer:///providers/your-provider-id'
Layer::IdentityToken.layer_key_id = 'layer:///keys/your-key-id'

key = File.readlines('./config/private_key.pem').join('')
Layer::IdentityToken.layer_private_key = OpenSSL::PKey::RSA.new(key)
