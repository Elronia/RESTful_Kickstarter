class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        # digesting the request: going through the params hash and checking in with the model to create a new instance
        project_params = params.require(:project).permit(:title, :description)
        @project = Project.create(project_params)
        # response: redirect to the '/projects', which will trigger the index action
        redirect_to projects_path
    end

    def show
        @project = Project.find(params[:id])
    end


end
