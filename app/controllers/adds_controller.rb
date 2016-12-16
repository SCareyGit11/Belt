class AddsController < ApplicationController
  def create
  	song = Song.find(params['song_id'])
			add = Add.create(user: current_user, song: song)
			
			redirect_to '/songs/index'
  end
end
