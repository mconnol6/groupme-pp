class ChannelsController < ApplicationController
	def show
		puts params
		  @channel = Channel.find(params[:id])
		  @messages = Message.where(channel_id: @channel.id)
		  puts @messages
			render :text => @messages.to_json
	end

	def get_messages_for_channel
	  render :text => (Message.where(channel_id: Channel.find_by( title: params[:channel_name]).id)).to_json
  end
end
