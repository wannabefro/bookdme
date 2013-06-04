class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # binding.pry
    if user.role == 'act'
      can :read, :all
      can :create, Act
      can :update, Act do |act|
        act.try(:user) == user
      end
    elsif user.role == 'user'
      can :read, :all
    end
  end
end
