class AdsController < ApplicationController
  before_filter :create_url

  def index

    puts request.user_agent
    if request.user_agent.include? "iPhone"
      render "iphone.js"
    else
      redirect_to @url
    end
  end

  def lookup
    uri = URI(request.original_url)
    @name= params[:path]
    if request.user_agent.include? "iPhone"
      render "iphone.js"
    else
      redirect_to @url
    end
  end

  def create_url()
    if params[:path]
      @url = 'https://www.instagram.com/' + params[:path]
    else
      @url = 'https://www.instagram.com/' + params[:username]
    end
  end
end
