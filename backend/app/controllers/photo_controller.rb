class PhotoController < ApplicationController
    def list
        @photos = Photo.all 
    end

    def show
        @photo = Photo.find(params[:id])
    end

    def new
        @photo = Photo.new
        @project_id = params[:project_id]
    end

    def create
        @photo = Photo.new(photo_params)
        
        puts @photo.project_id
        puts @photo.description
        @photo.validate!
        puts @photo.errors.full_messages

        if @photo.save 
            redirect_to :action => 'list'
        else
            
            render :action => 'new'
        end
    end

    def photo_params
        params.require(:photos).permit(:project_id, :description)
    end

    def edit
        @photo = Photo.find(params[:id])
    end

    def update
        @photo = Photo.find(params[:id])

        if @photo.update_attributes(photo_param)
            redirect_to :action => 'show', :id => @photo
        else
            render :action => 'edit'
        end
    end

    def photo_param 
        params.require(:photo).permit(:project_id, :description)
    end


    def delete
        Photo.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
end
