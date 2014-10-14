class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.role == "admin"
        can :manage, :all
      elsif user.role == "manager"
        can [:index, :show, :new, :edit, :create, :update], [User, Asset, Rental]
        can [:checkin, :checkout], Asset
      elsif user.role == "renter"
        can [:show, :edit, :update, :destroy], User, :id => user.id
        can [:show, :create], Rental, :user_id => user.id
        can :read, Asset
      end
    else
      can :create, User
    end
  end
end
