class AuthorSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Logowanie udane! Gratulacje!')
    else
      flash.now.alert = "Logowanie nieudane."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:articles, notice: 'Wylogowano!')
  end
end
