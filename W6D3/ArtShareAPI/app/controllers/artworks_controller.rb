class ArtworksController < ApplicationController

    def index
        artworks = Artwork.all
        render json: artworks
    end 

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork, status: :created
        else
            render json: artwork.error.full_messages, status: :unprocessable_entity
        end 
    end 

    def show 
        artwork = Artwork.find(params[:id])
        render json: artwork
    end 

    def update 
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            render json: artwork 
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end 
    end 

    def destroy 
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end 

    private
    def user_params
        params.require(:user).permit(:username)
    end
    
end
