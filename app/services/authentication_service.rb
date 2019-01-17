module AuthenticationService
  class << self
    def authenticate!(req)
      user = User.find_for_authentication(username: req['data']['attributes']['username'])
      raise Unauthorized, 'Bad credentials' if user.nil? || !user.valid_password?(req['data']['attributes']['password'])

      user
    end
  end

  class Unauthorized < StandardError; end
end
