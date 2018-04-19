class EventsController < ApplicationController
    def index
        @user = User.find(session[:id])
        @events = Event.all
        @instate = Event.where(state: @user.state)
    end

    def show
        @user = User.find(session[:id])
        @event = Event.find(params[:id])
        @messages = Event.find(params[:id]).messages
        @attendees = Event.find(params[:id]).users
        @count = @attendees.count
    end

    def create
        @event = Event.new(name: params[:name], date: params[:date], city: params[:city], state: params[:state], user: User.find(session[:id]))

        if @event.save
            @join = Attendance.new(user: User.find(session[:id]), event: Event.find(@event.id))
            @join.save
            redirect_to "/events/index"
        else
            flash[:errors] = @event.errors.full_messages
            redirect_to "/events/index"
        end

    end

    def join
        @join = Attendance.new(user: User.find(session[:id]), event: Event.find(params[:id]))
        @join.save
        redirect_to "/events/#{params[:id]}"
    end



end
