class EpisodesController < ApplicationController
    before_action :find_podcast # to find podcast
    before_action :find_episode, only: [:show]
    
    def new
        @episode = @podcast.episodes.new #finding the podcast by the podcast params below - line25 then creating new episode
    end
    
    def create
        @episode = @podcast.episodes.new episode_params
        if @episode.save # if the episode is able to save
            redirect_to podcast_episode_path(@podcast, @episode) #going to the episode path, nested within the podcast path
        else
            render 'new'
        end
    end
    
    def show
        @episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").reject { |e| e.id == @episode.id } # find all the episodes that belong to the podcast & reject an episode if its the current episode from that loop
    end
    
    private
    
    def episode_params
        params.require(:episode).permit(:title, :description) #require the params for the episode & then permit attributes
    end
    
    def find_podcast
        @podcast = Podcast.find(params[:podcast_id]) # find a podcast by its ID
    end
    
    def find_episode
        @episode = Episode.find(params[:id]) # find an episode by its ID
    end
end
