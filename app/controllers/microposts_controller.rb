# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :restrict, only: %i[new create]

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(user_params)
    @micropost.user = current_user
    redirect_to microposts_index_path if @micropost.save
  end

  def index
    @microposts = Micropost.all
  end

  private

  def restrict
    redirect_to login_path unless logged_in?
  end

  def user_params
    params.require(:micropost).permit(:title, :content)
  end
end
