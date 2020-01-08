class BrowseController < ApplicationController
    def browse
        liked_account_ids = Like.where(account_id: current_account.id).pluck(:liked_account_id)
        liked_account_ids << current_account.id

        @users = Account.where.not(id: liked_account_ids)
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

    # def conversation
    #     @profile = Account.find_by_id(params[:id])

    #     # if @profile.present?
    #     #     #get convos for user
    #     #     # respond_to do |format|
    #     #     #     format.js{
    #     #     #         render "browse/conversation"
    #     #     #     }
    #     #     # end
    #     #     render partial: "browse/conversation"
    #     # end
    # end

end
