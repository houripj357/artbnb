class ConversationsController < ApplicationController
	def index 
		@conversations = current_user.mailbox.conversations
	end

	def inbox 
		@conversations = current_user.mailbox.inbox
		render action: :index
	end 

	def sent 
		@conversations = current_user.mailbox.sentbox
		render action: :index
	end 

	def trash 
		@conversations = current_user.mailbox.trash
		render action: :index
	end 

	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])
		@conversation.mark_as_read(current_user)
	end

	def new 
		@recipients = User.all - [@current_user]
	end

	def create 
		@recipients = User.where(params[:user_id])
		receipt = current_user.send_message(@recipients,
			params[:body],
			params[:subject], 
			true, 
			params[:attachment],
			)
		# @conversation = Conversation.new
		# (@conversation.users.uniq - [current_user]).each do |user|
        	# Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @message)
      	# end
		redirect_to all_conversations_path
	end


  # def create
  #   recipients = User.where(id: conversation_params[:recipients])
  #   receipt = current_user.send_message(recipients, 
  #   	conversation_params[:body], 
  #   	conversation_params[:subject]
  #   	).conversation
  #   flash[:success] = "Your message was successfully sent!"
  #   redirect_to conversation_path(conversation)
  # end

  # private

  # def conversation_params
  #   params.require(:conversation).permit(:subject, :body,recipients:[])
  # end

end
