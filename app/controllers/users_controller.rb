class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @octokit_client = Octokit::Client.new(:client_id => Rails.application.secrets.omniauth_provider_key,
                                          :client_secret =>
                                          Rails.application.secrets.omniauth_provider_secret)
    
    @github_user = @octokit_client.user 'pconrad'
    
  end

end
