class SessionsController < ApplicationController
    def new
    end

    def create
        if user_params[:password] != params[:confirmpw]
            flash[:errors] = ["Passwords do not match"]
            redirect_to "/sessions/new"
        else
           @user = User.new(user_params)
           if  @user.save
               session[:id] = @user.id
               redirect_to "/events/index"
           else
               flash[:errors] = @user.errors.full_messages
               redirect_to "/sessions/new"
           end
       end
   end

   def login
       if !(User.find_by(email: params[:login_email])).nil?
           @user = User.find_by(email: params[:login_email])
           if @user.authenticate(params[:login_password])
               session[:id] = @user.id
               redirect_to "/events/index"
           else
               flash[:errors] = ["Invalid Combination"]
               redirect_to "/"
           end
       else
           flash[:errors] = ["Invalid Combination"]
           redirect_to "/"
       end
   end

   def destroy
       reset_session
       redirect_to "/"
   end

   private
       def user_params
           params.require(:user).permit(:fname, :lname, :email, :city, :state, :password)
       end

end
