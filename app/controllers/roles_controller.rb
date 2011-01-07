class RolesController < ApplicationController
  before_filter :load_all_roles, :only => [:index]
  before_filter :load_role, :only => [:show, :edit]
  before_filter :load_new_role, :only => [:new, :create]

  def load_all_roles
    @roles = Role.all
  end

  def load_role
    @role = Role.find params[:id]
  end

  def load_new_role
    @role = Role.new
  end
  public

  def index
  end

  def show
  end

  def new
  end

  def create
    if Role.create(params[:role])
      flash[:notice] = "Role created"
      redirect_to :action => :index
    else
      flash[:error] = "Error creating role"
    end
  end

  def edit
  end

  def update
  end
end
