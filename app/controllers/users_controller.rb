class UsersController < ApplicationController
    def edit
        @user = User.find(session[:id])
    end

    def update
        @user = User.find(session[:id])
        @user.fname = params[:fname]
        @user.lname = params[:lname]
        @user.email = params[:email]
        @user.city = params[:city]
        @user.state = params[:state]
        if @user.save
            redirect_to "/events/index"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
        end
    end




end
