class DeviseParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end