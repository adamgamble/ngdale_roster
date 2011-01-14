class UsersController < ApplicationController
  before_filter :login_required,  :except => [:index, :new, :create]
  before_filter :load_new_user,   :only   => [:new]
  before_filter :load_all_users,  :only   => [:index]
  before_filter :load_user,       :only   => [:show]

  private
  def add_roles_to_user user
    user.user_join_roles.destroy_all
    params["roles"].each do |role|
      r = Role.find(role)
      r.add_user_to_role! user unless user.roles.include?(r)
    end
  end

  def load_new_user
    @user = User.new
  end

  def load_all_users
    @users = User.all
  end

  def load_user
    @user = User.find params[:id]
    if @user.nil?
      flash[:error] = "Can't find that user"
      redirect_to :index
    end
  end
  public
  def new
  end

  def index
  end

  def show
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
