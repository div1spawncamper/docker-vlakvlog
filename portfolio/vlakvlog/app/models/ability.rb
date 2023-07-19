class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.has_role?(:admin)
      # Admin permissions
      can :manage, :all
    elsif user.has_role?(:logged_in)
      # Permissions for logged-in users
      can :create, Article
      can [:update, :destroy], Article, user_id: user.id
      can :read, Comment
      can [:create, :update, :destroy], Comment, user_id: user.id
    else
      # Guest permissions (read-only)
      can :read, :all
    end
  end
end
