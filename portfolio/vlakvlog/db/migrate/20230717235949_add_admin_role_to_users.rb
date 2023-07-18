class AddAdminRoleToUsers < ActiveRecord::Migration[6.1]
  def up
    # Lista de los usuarios a los que quieres asignar el rol de admin
    admin_users = ["div1spawncamper", "mgmerino", "github_username3"]

    admin_users.each do |username|
      user = User.find_by(username: username)
      user.add_role :admin if user
    end
  end

  def down
    # Este es el código que se ejecutará si decides revertir esta migración.
    User.with_role(:admin).each do |user|
      user.remove_role :admin
    end
  end
end
