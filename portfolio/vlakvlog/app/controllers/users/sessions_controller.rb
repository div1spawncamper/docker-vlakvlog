class Users::SessionsController < Devise::SessionsController
  def destroy
    super do
      # Agrega cualquier lógica adicional que necesites después del cierre de sesión
      # Por ejemplo, puedes redirigir a una página específica o mostrar un mensaje de éxito.
    end
  end
end
