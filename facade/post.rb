# app/facades/users_facade.rb

class UsersFacade
  attr_reader :current_user, :vip_presenter

  def initialize(current_user, vip_presenter=VipUsersPresenter)
    @current_user = current_user
    @vip_presenter = vip_presenter
  end

  def new_user
    User.new
  end

  def last_active_users
    @last_active_users ||= active_users.order(created_at: :desc).limit(10)
  end

  def vip_users
    @vip_users ||= vip_presenter.new(active_users.vip).users
  end

  def messages
    @messages ||= current_user.messages
  end

  private
  def active_users
    User.active
  end
end

class UsersController < ApplicationController
  def index
    @user_facade = UsersFacade.new(current_user)
  end
end