class ChatsController < ApplicationController
  def new_message
    @message = Message.new()
    @message.username = session[:username]
    @message.username = params[:message]
    @message.save()
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
    #redirect_to login_new_path unless session[:username]
  end

  def all_messages
    render :text => "fuck"
  end

  def get_all_messages
    render :text => Message.all.to_json
  end
end
