class MugshotsController < ApplicationController

    def new
      @mugshot = Mugshot.new
    end
    
    def create
      @mugshot = Mugshot.new(params[:mugshot])
      if @mugshot.save
        flash[:notice] = 'Mugshot was successfully created.'
        redirect_to mugshot_url(@mugshot)     
      else
        render :action => :new
      end
    end

end
