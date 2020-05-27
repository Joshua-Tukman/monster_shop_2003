class UsersController < ApplicationController

    def new

    end

    def create
      user = User.new(user_params)
      if user.save
        flash[:notice] = "You are now registered and logged in"
          redirect_to "/profile"
      else
          flash[:error] = user.errors.full_messages.to_sentence
          render :new
      end
    end

    private

    def user_params
        params.permit(:name, :address, :city, :state, :zip, :email, :password)
    end
end
