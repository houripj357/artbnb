OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, ENV['1767984590146588'], ENV['446592dd96ae17643664a015052527cc']
end	