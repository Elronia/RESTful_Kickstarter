class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

#     @project[:ftitle] = params[:title]
#     @project[:last_name] = params[:last_name]
#     @project.save

end
