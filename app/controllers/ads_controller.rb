class AdsController < ApplicationController
  before_filter :create_url
  # protect_from_forgery :except => :index

  def index
    # logging - start click event
    @username = params[:username]
    puts request.user_agent
    if request.user_agent.include? "facebook"
      render 'lookup.html'
    end

    if request.user_agent.include? "iPhone"
      puts 'in if'
      render "iphone.html.erb"
    else
      redirect_to @url
    end
  end

  def lookup
    puts 'lookup'
    uri = URI(request.original_url)
    @username= params[:path]
    if request.user_agent.include? "iPhone"
      puts "iPhone"
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
