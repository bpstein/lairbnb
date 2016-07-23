class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
    @rooms = @user.rooms
    if @user.save 
      UserNotifier.send_signup_email(@user).deliver
    end
	end
end