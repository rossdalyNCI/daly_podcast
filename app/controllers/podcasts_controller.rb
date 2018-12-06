class PodcastsController < ApplicationController
    before_action :find_podcast, only: [:show, :dashboard]
    before_action :find_episode, only: [:show, :dashboard]
    
    def index
        @podcasts = Podcast.all.order("created_at DESC") # defining the @podcasts method, loop through all the podcasts and order by created at in descending order
    end
    
    def show # defining the action show
    end
    
    def dashboard
    end
    
    private
    
    def find_episode
        @episodes = Episode.where(podcast_id: @podcast).order("created_at DESC") # find the episode by podcast ID
    end
    
    def find_podcast
        if params[:id].nil? # conditional statement if rails cannot find a podcast(user) without an id
            @podcast = current_podcast
        else
        @podcast = Podcast.find(params[:id]) # Find the podcast by the parameters of id
        end
    end
end
