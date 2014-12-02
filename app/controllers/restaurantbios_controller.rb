class RestaurantbiosController < ApplicationController
  def show
  	@post = Post.find(params[:id])
  	@hash = Gmaps4rails.build_markers(@post.user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.restname
    end
  end
end
