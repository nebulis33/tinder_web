class BrowseController < ApplicationController
    def browse
        liked_account_ids = Like.where(account_id: current_account.id).pluck(:liked_account_id)
        liked_account_ids << current_account.id

        @users = Account.includes(:images_attachments).where.not(id: liked_account_ids)
        @matches = current_account.matches
    end

    def approve
        account_id = params[:id]
        logger.debug "User id for matching is #{account_id}"
        new_like = Like.new(liked_account_id: account_id)
        new_like.account_id = current_account.id

        if new_like.save
            @existing_like = Like.where(account_id: account_id, liked_account_id: current_account.id).exists?
        else
            #issue saving like
        end
    end

    def decline
    end

    def open_conversation
        id = params[:id]
        @profile = Account.find(id)
        # likes = Like.where(account_id: current_account.id, liked_account_id: account_id)
        # @match = likes.first if likes.size > 0
        conversation = Conversation.between(id, current_account.id)

        @conversation = conversation.size > 0 ? conversation.first : Conversation.new
        @messages = @conversation.messages.includes(account: :images_attachments) if @conversation.persisted?
        @message = @conversation.messages.build

        if @profile.present?

            respond_to do |format|
                format.js {
                    render "browse/conversation"
                }
            end

        end
    end

end
