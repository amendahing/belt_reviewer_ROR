class MessageController < ApplicationController

    def create
        puts params[:event], "______________________________"
        # @message = Message.new(content: params[:content], user: User.find(session[:id]), event: Event.find(params[:event]))
        redirect_to "/events/#{params[:event]}"
    end

end
