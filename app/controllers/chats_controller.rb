class ChatsController < ApplicationController
  def new_message
    @message = Message.new()
    @message.username = session[:username]
    @message.message = params[:message]
	@message.channel_id = Channel.find_by(title: session[:channel]).id
    @message.save()
    # Check if the message is private
    if recipient = params[:message].match(/@(.+) (.+)/)
      # It is private, send it to the recipient's private channel
      @channel = "/messages/private/#{recipient.captures.first}"
      @message = { :username => session[:username], :msg => recipient.captures.second }
    else
      @channel = "/messages/#{session[:channel]}"
      @message = { :username => session[:username], :msg => params[:message] }
    end

    respond_to do |f|
      f.js
    end
  end

  def chat
    redirect_to login_new_path unless session[:username]
	redirect_to choose_channel_path unless session[:channel]
  end

  def all_messages
    render :text => "fuck"
  end

  def get_all_messages
	  render :text => Message.all.to_json
  end

  def public_channel
	  if Channel.exists?(title: 'public')
		  session[:channel] = 'public'
		  redirect_to chat_path
	  else
		  @channel = Channel.new
		  @channel.title = 'public'
		  @channel.save
		  session[:channel] = 'public'
		  redirect_to chat_path

	  end
  end

  def set_channel
	  if Channel.exists?(title: params[:title])
		  session[:channel] = params[:title]
		  redirect_to chat_path
	  else
		  @channel = Channel.new
		  @channel.title = params[:title]
		  @channel.save
		  session[:channel] = params[:title]
		  redirect_to chat_path
	  end
  end

  def choose_channel
	  redirect_to login_new_path unless session[:username]
	end

  def room
	  redirect_to choose_channel_path unless session[:channel]
  end
end
