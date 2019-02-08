module AuthenticationService
  class << self
    def authenticate!(req)
      user = User.find_for_authentication(username: req['data']['attributes']['username'])
      raise Unauthorized, 'Bad credentials' if user.nil? || !user.valid_password?(req['data']['attributes']['password'])

      user
    end

    def authenticate_token!(req)
      header = req.headers['Authorization']
      raise Unauthorized, 'Missing token' if header.nil?

      decoded_token = extract_token(header)
      User.find_by!(id: decoded_token[0]['id'], username: decoded_token[0]['username'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      raise Unauthorized, 'Bad credentials'
    end

    private

    def extract_token(header)
      token = header.split(' ').last
      JWT.decode(token, Rails.application.credentials.jwt_secret, true)
    end
  end

  class Unauthorized < StandardError; end
end
