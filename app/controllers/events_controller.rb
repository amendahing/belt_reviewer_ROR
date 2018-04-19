class EventsController < ApplicationController
    def index
        @user = User.find(session[:id])
        @events = Event.all
        @instate = Event.where(state: @user.state)
        @outstate = Event.where.not(state: @user.state)
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
        redirect_to "/events/index"
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        @event.name = params[:name]
        @event.date = params[:date]
        @event.city = params[:city]
        @event.state = params[:state]
        if @event.save
            redirect_to "/events/index"
        else
            flash[:errors] = @event.errors.full_messages
            redirect_to "/events/#{@event.id}/edit"
        end
    end

    def destroy
        event = Event.find(params[:id]).destroy
        redirect_to "/events/index"
    end

    def cancel
        Attendance.find_by(user: User.find(session[:id]), event: Event.find(params[:id])).destroy
        redirect_to "/events/index"
    end

end
