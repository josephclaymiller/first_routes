class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render :json => user
    # render :json => params[:id]
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => { :message => "User destroyed" }
  end
end
