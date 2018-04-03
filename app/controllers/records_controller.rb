class RecordsController < ApplicationController
	include HTTParty
	before_action :require_login	

  def index
  end

  def show_repos
  	url = "https://api.github.com/users/#{current_user.username}/repos?access_token=#{current_user.oauth_token}"
    @resp = HTTParty.get(url)
  end

  def show_commits
    if params[:date].present?
      url = "https://api.github.com/repos/#{params[:owner]}/#{params[:name]}/commits?access_token=#{current_user.oauth_token}&since=#{params[:date]}"
    else
  	  url = "https://api.github.com/repos/#{params[:owner]}/#{params[:name]}/commits?access_token=#{current_user.oauth_token}"
    end
    @resp = HTTParty.get(url).to_json
    respond_to do |format|
      format.json { render json: @resp }
      format.html { @resp }
    end
  end

end
