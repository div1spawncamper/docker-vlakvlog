class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Article
      can [:update, :destroy], Article, user_id: user.id
    end
  end
end
