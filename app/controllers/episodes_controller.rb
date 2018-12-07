class EpisodesController < ApplicationController
    before_action :authenticate_podcast!, except: [:show] #if the user tries to access any other page of episodes, except for the show page, and they are NOT signed in, this devise action forwards user to login page
    before_action :require_permission
    before_action :find_podcast # to find podcast
    before_action :find_episode, only: [:show, :edit, :update, :destroy] #to find episode
    
    def new
        @episode = @podcast.episodes.new #finding the podcast by the podcast params below - line25 then creating new episode
    end
    
    def create
        @episode = @podcast.episodes.new episode_params
        if @episode.save # if the episode is able to save
            redirect_to podcast_episode_path(@podcast, @episode) #going to the episode path, nested within the podcast path
        else
            render 'new' # else render new form
        end
    end
    
    def show
        @episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").reject { |e| e.id == @episode.id } # find all the episodes that belong to the podcast & reject an episode if its the current episode from that loop
    end
    
    def edit # edit action
    end
    
    def update # update action
        if @episode.update episode_params # if the episode is updated with the episode attributes, then redirect back to podcast>episode path.
        redirect_to podcast_episode_path(@podcast, @episode), notice: "You updated an episode" # with a message informing user they have updated their episode, that's nested within podcast
        else
        render 'edit' # else render the edit form
        end
    end
    
    def destroy #finding the episode in the before_action
        @episode.destroy #delete the episode
        redirect_to root_path #redirect user back to dashboard
    end
    
    private
    
    def episode_params
        params.require(:episode).permit(:title, :description, :episode_thumbnail, :mp3) #require the params for the episode & then permit attributes
    end
    
    def find_podcast
        @podcast = Podcast.find(params[:podcast_id]) # find a podcast by its ID
    end
    
    def find_episode
        @episode = Episode.find(params[:id]) # find an episode by its ID
    end
    
    def require_permission # defining an action to prevent User1 from editing USer2 episodes
        @podcast = Podcast.find(params[:podcast_id]) # find the podcast by podcastID
        if current_podcast != @podcast # if the podcast(user) is not equal to the found podcast
            redirect_to root_path, notice: "You do not have access to this page" #then redirect back to root path
        end
    end
end
