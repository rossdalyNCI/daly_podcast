class PodcastsController < ApplicationController
    before_action :find_podcast, only: [:show, :dashboard]
    before_action :find_episode, only: [:show, :dashboard]
    
    def index
        @podcasts = Podcast.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8) # defining the @podcasts method, loop through all the podcasts and order by created at in descending order & using the .paginate method
    end
    
    def show # defining the action show
    end
    
    def dashboard
    end
    
    private
    
    def find_episode
        @episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").paginate(:page => params[:page], :per_page => 4) # find the episode by podcast ID & using the .paginate method to limit the podcast per page to 4
    end
    
    def find_podcast
        if params[:id].nil? # conditional statement if rails cannot find a podcast(user) without an id
            @podcast = current_podcast
        else
        @podcast = Podcast.find(params[:id]) # Find the podcast by the parameters of id
        end
    end
end
