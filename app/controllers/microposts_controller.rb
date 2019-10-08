# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :restrict, only: %i[new create]

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to microposts_path
    else
      render 'static_pages/home'
    end
  end

  def index
    @microposts = Micropost.all
  end

  private

  def restrict
    redirect_to login_path unless logged_in?
  end

  def micropost_params
    params.require(:micropost).permit(:title, :content)
  end
end
