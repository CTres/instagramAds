class AdsController < ApplicationController
  before_filter :create_url
  # protect_from_forgery :except => :index

  def index
    # logging - start click event
    session[:state] = 'hello'
    puts session[:state]
    @username = params[:username]
    puts request.user_agent

    respond_to do |format|
      format.all {
        if request.user_agent.include? "externalhit"
          puts 'externalhit'
          render 'lookup.html'
        elsif request.user_agent.include? "iPhone"
          puts 'iphone'
          render "iphone.html.erb"
        else
          puts 'non iphone'
          redirect_to @url
        end
        }
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
