class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.has_role?(:admin)
      can :manage, :all
    elsif user.has_role?(:logged_in)
      can :create, Article
      can [:update, :destroy], Article, user_id: user.id
      can [:read, :delete_image], Article, user_id: user.id
      can :read, Comment
      can [:create, :update, :destroy, :delete_image], Comment, user_id: user.id
    else
      can :read, :all
    end
  end
end
