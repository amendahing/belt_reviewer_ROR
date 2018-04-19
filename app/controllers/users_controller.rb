class UsersController < ApplicationController
    def edit
        @user = User.find(session[:id])
    end

    def update
        @user = User.find(session[:id])
        @user.update(edit_params)
        if @user.save
            redirect_to "/events/index"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
        end
    end

    private
        def edit_params
            params.require(:edit).permit(:fname, :lname, :email, :city, :state)
        end


end
