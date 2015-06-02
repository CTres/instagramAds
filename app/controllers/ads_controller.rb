class AdsController < ApplicationController

  def index
    puts "hiiiii"
    puts request.user_agent

    if request.user_agent.include? "iPhone"
      puts "OMG ITS AN IPHONE"
      redirect_to url("instagram://user?username=colintres")
    end
  end


end
