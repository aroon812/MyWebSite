class ProjectController < ApplicationController
    def list
        @projects = Project.all 
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save 
            redirect_to :action => 'list'
        else
            puts 'hello'
            render :action => 'new'
        end
    end

    def project_params
        params.require(:projects).permit(:title, :description)
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])

        if @project.update_attributes(project_param)
            redirect_to :action => 'show', :id => @project
        else
            render :action => 'edit'
        end
    end

    def project_param 
        params.require(:project).permit(:title, :description)
    end

    def delete
        Project.find(params[:id]).destroy
        redirect_to :action => 'list'
    end

    def show_photos
        @photo = Photo.find(params[:id])
    end
end
