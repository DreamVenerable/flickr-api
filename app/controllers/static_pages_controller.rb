class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new

    if params[:user_id]
      begin
        unless params[:user_id].empty?
          @img = flickr.photos.search(user_id: params[:user_id])
        end
      rescue Flickr::FailedResponse
        @img = nil
      end
    end
  end
end
