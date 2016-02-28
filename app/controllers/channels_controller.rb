class ChannelsController < ApplicationController
	def show
		puts params
		  @channel = Channel.find(params[:id])
		  @messages = Message.where(channel_id: @channel.id)
		  puts @messages
			render :text => @messages.to_json
	end
end
