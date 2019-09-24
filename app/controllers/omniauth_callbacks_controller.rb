class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth["provider"], uid: auth["uid"])
            .first_or_initialize(email: auth["info"]["email"])
    user.name ||= auth["info"]["name"]
    user.save!

    user.remember_me = true
    sign_in(:user, user)

    redirect_to after_sign_in_path_for(user)
  end

  def failure
    redirect_to root_path
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
end