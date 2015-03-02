class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.role == "admin"
        can :manage, :all
      elsif user.role == "manager"
        can [:index, :show], Asset
        can [:index, :show, :new, :edit, :create, :update], [User, Rental]
        can [:checkin, :checkout], Asset
      elsif user.role == "renter"
        can [:show, :edit, :update, :destroy], User, :id => user.id
        can [:show, :create], Rental, :user_id => user.id
        can [:index, :show], Asset, types: { id: Settings::RentableAssetType.get.rentable_asset_type }
      end
    else
      can :create, User
    end
  end
end
