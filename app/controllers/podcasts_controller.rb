class PodcastsController < ApplicationController
    def index
        @podcasts = Podcast.all.order("created_at DESC") # defining the @podcasts method, loop through all the podcasts and order by created at in descending order
    end
    
    def show # defining the action show
        @podcast = Podcast.find(params[:id]) # Find the podcast by the parameters of id
    end
end
