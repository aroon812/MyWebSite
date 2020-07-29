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
            redirect_to :action => 'show', :controller => 'project', :id => @photo.project_id
        else
            
            render :action => 'new'
        end
    end

    def edit
        @photo = Photo.find(params[:id])
    end

    def update
        @photo = Photo.find(params[:id])

        if @photo.update_attributes(photo_params)
            redirect_to :action => 'show', :id => @photo
        else
            render :action => 'edit'
        end
    end

    def photo_params
        params.require(:photo).permit(:project_id, :description, :file)
    end
    
    def delete
        photo = Photo.find(params[:id])
        project_id = photo.project_id
        photo.destroy()
        redirect_to :action => 'show', :controller => 'project', :id => project_id
    end
end
