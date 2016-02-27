class ChatsController < ApplicationController
  def new_message
    # Check if the message is private
    if recipient = params[:message].match(/@(.+) (.+)/)
      # It is private, send it to the recipient's private channel
      @channel = "/messages/private/#{recipient.captures.first}"
      @message = { :username => session[:username], :msg => recipient.captures.second }
    else
      # It's public, so send it to the public channel
      @channel = "/messages/public"
      @message = { :username => session[:username], :msg => params[:message] }
    end

    respond_to do |f|
      f.js
    end
  end

  def room
    redirect_to login_new_path unless session[:username]
  end
end
