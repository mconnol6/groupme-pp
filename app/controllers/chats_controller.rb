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

  def all_messages
    if session[:msglog]
      session[:msglog] << {:username => params[:username], :msg => params[:msg]}
    else
      session[:msglog] = [{:username => params[:username], :msg => params[:msg]}]
    end
    render :text => "fuck"
  end

  def get_all_messages
    render :text => ActiveSupport::JSON.encode(session[:msglog])
  end
end
