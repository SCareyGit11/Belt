class SongsController < ApplicationController
  def index
  	@songs = Song.all
  end

  def new
  end

  def show
  	@song = Song.find(params[:id])
  	@user = Song.where()
  end

  def create
  	@song = Song.new(song_params)
  	# redirect_to '/songs/index'
  	respond_to do |format|
	      if @song.save
	      	
	        format.html { redirect_to "/songs/index", notice: 'Song was successfully created.' }
	        format.json { render action: 'songs#index', status: :created, location: @song }
	      else
	        format.html { 
	        	flash['errors'] = @song.errors.full_messages

	        	redirect_to '/songs/index'
	        	# render :new
	        }
	        format.json { render json: @song.errors, status: :unprocessable_entity }
	      end
	    end
  end

  def song_params
  	params.require(:song).permit(:artist, :title)
  end


end
