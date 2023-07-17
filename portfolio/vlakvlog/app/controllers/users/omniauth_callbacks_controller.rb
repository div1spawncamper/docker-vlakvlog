# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # Aquí debes implementar la lógica para manejar la respuesta de GitHub y
    # encontrar o crear el usuario en tu base de datos. Omniauth añade la información
    # de la respuesta de GitHub en request.env['omniauth.auth'].
    auth = request.env['omniauth.auth']

    # Intentas encontrar un usuario existente por el id de GitHub
    @user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless @user
      # Si el usuario no existe, creas uno nuevo con los datos devueltos por GitHub
      @user = User.create(
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    if @user.persisted?
      # Si el usuario se ha guardado correctamente, inicias la sesión y rediriges al usuario
      sign_in_and_redirect @user, event: :authentication
    else
      # Si hubo un problema al guardar el usuario, rediriges al usuario a la página de registro
      redirect_to new_user_registration_url
    end
  end
end
