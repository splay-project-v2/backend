module UserService
  class << self
    def create_user!(req)
      User.create!(
        email: req['data']['attributes']['email'],
        login: req['data']['attributes']['login'],
        password: req['data']['attributes']['password'],
        password_confirmation: req['data']['attributes']['password_confirmation']
      )
    end
  end
end
