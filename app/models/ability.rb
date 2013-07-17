class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
    if user.role? 'admin'
        can :manage, :all
    elsif user.role? 'partner'
        can :read, :all
        can :account, User
        can :manage , Event do |event|
          user.id==event.creator_id
        end
    else
        can :read, :all
        can :create, User
        can :account, User
    end
  end
end
