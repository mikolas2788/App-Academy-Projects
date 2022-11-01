class CatsController < ApplicationController

    def index
        cats = Cat.all
        render :index
    end 
    
    def show
        
    end 
    
    def new 

    end 
    
    def create
        
    end 

    def edit 

    end 

    def update

    end  

    private
    def cat_params 
        params.require(:cat).permit(:name, :color, :sex, :birth_date, :description)
    end 

end
