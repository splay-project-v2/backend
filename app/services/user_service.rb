class UserService
  def initialize(params)
    @email = params['data']['attributes']['email']
    @login = params['data']['attributes']['login']
    @password = params['data']['attributes']['password']
    @password_confirmation = params['data']['attributes']['password_confirmation']
  end

  def call
    User.create!(email: @email, login: @login, password: @password, password_confirmation: @password_confirmation)
  end
end
