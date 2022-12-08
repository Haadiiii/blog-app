class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :create, Post
      can :create, Comment
      can :create, Like
      can :destroy, Post do |post|
        post.author == user
      end
      can :destroy, Comment do |comment|
        comment.author == user
      end
      can :destroy, Like do |like|
        like.author == user
      end
      can :update, Post do |post|
        post.author == user
      end
      can :update, Comment do |comment|
        comment.author == user
      end
      can :update, Like do |like|
        like.author == user
      end
    end
  end
end
