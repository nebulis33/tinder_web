class ConversationsController < ApplicationController

    def create
        @conversation = Conversation.new(conversation_params)
        @conversation.sender_id = current_account.id
        @conversation.messages.first.account_id = current_account.id

        if @conversation.save!
            logger.debug "conversation has been saved"
        else
            logger.debug "conversation has NOT been saved!!"
        end
    end

    def update
        @conversation = Conversation.find(params[:id])

        if @conversation.update!(conversation_params)
            respond_to do |format|
                format.js {
                    @messages = @conversation.messages
                    render 'browse/conversation_messages'
                }
            end
        end
    end

    private

        def conversation_params
            params.require(:conversation).permit(:recipient_id, messages_attributes: [:body, :account_id])
        end

end