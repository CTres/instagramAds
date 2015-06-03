class AdsController < ApplicationController

  def index
    puts "hiiiii"
    puts request.user_agent

    if request.user_agent.include? "iPhone"
      render "iphone.js"
    end
  end


end
