class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	# redirect_to '/songs/index'
  	respond_to do |format|
	      if @user.save
	      	 
	        format.html { redirect_to "/sessions", notice: 'User was successfully created.' }
	        format.json { render action: 'songs#index', status: :created, location: @user }
	      else
	        format.html { 
	        	flash['errors'] = @user.errors.full_messages

	        	redirect_to '/users/new'
	        	# render :new
	        }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
  end

  	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
