class TestsessionsController < ApplicationController
  def create
    user = User.find_by(email:"example@railstutorial.org")
    session[:user_id] = user.id
    flash[:success] = "テストユーザとしてログインしました。"
    redirect_to root_path
  end
end