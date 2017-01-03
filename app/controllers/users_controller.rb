class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @octokit_client = Octokit::Client.new(:access_token => session[:oauth_token])
    @github_user = @octokit_client.user
    @emails = @octokit_client.emails
    @organizations = @octokit_client.organizations
    
  end

end
