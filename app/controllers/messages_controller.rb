class MessagesController < ApplicationController
    def create

        @message = Message.new(content: params[:content], user: User.find(session[:id]), event: Event.find(params[:event]))
        if @message.save
            redirect_to "/events/#{params[:event]}"
        else
            flash[:errors] = @message.errors.full_messages
            redirect_to "/events/#{params[:event]}"
        end
    end
end
