class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  private
  def add_roles_to_user user
    params["roles"].each do |role|
      r = Role.find(role)
      user.roles << Role.find(role) unless user.roles.include?(r)
    end
    @user.save
  end

  public
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      add_roles_to_user @user
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to "/"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      add_roles_to_user @user
      flash[:notice] = "Your profile has been updated."
      redirect_to "/"
    else
      render :action => 'edit'
    end
  end
end
