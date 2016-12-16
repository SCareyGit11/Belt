class SessionsController < ApplicationController
	def welcome
		# session[:id] = nil
		reset_session
		redirect_to '/users/new'
	end

	def new
		@user = User.last
		session[:user_id] = @user.id
		redirect_to '/songs/index'
	end

	def create
		@user = User.find_by_email(params[:email])
		
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to '/songs/index'
		else
			flash['errors'] = ["Login Not Found"]	
			redirect_to '/users/new'
		end
	end

	def destroy
		# reset_session
		# session[:id] = nil
		reset_session
		redirect_to '/users/new'
	end
end
