# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_admin_user)
     current_admin_user ||= AdminUser.new 
      if current_admin_user.role == "admin" 
        can :manage, Section
        can :manage, Shelf
        can :manage, Book
        can :manage, AdminUser
        can :read, ActiveAdmin::Page, name: "Dashboard"
      else
        can :read, Section
        can :read, Shelf
        can :read, Book
        can :read, AdminUser, id: current_admin_user.id
        can :read, ActiveAdmin::Page, name: "Dashboard"
      end
  end
end
