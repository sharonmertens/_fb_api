class ApplicationController < ActionController::API

  def authenticate_token
   # puts "AUTHENTICATE JWT"
   render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
 end

 def bearer_token
   # puts "BEARER TOKEN"
   header = request.env["HTTP_AUTHORIZATION"]

   pattern = /^Bearer /
   # puts 'TOKEN WITHOUT BEARER'
   header.gsub(pattern, '') if header && header.match(pattern)
 end

 def decode_token(token_input)
   JWT.decode(token_input, ENV['JWT_SECRET'], true)
 rescue
   render json: {status: 401, message: 'Unauthorized'}
 end

end
