class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    Octokit.auto_paginate = true
    
    @octokit_client = Octokit::Client.new(:access_token => session[:oauth_token])
    @github_user = @octokit_client.user
    @emails = @octokit_client.emails
    @user_authenticated = @octokit_client.user_authenticated?

    @login = @octokit_client.user.login
    @is_member_f16 = @octokit_client.organization_member?('UCSB-CS56-F16',@login)
    @is_member_w15 = @octokit_client.organization_member?('UCSB-CS56-W15',@login)
    @organizations = @octokit_client.organizations
        
  end

end
