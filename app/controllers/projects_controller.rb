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

    def edit
        # digesting the request: crompiling data for the form from the model
        @project = Project.find(params[:id])
        # response: render edit form view
        render :edit
      end
    
      # patch '/students/:id'
    def update
        # digesting the request: going through the params hash and checking in with the model to update a the instance
        @project = Project.find(params[:id])
        project_params = params.require(:project).permit(:title, :description)
        @project.update(project_params)
    
        # response: redirect to the '/projects/:id', which will trigger the show action
        redirect_to project_path(@project)
    end
    
      # delete '/students/:id"
    def destroy
        # digesting the request: checking in with the model to find a project instance and destroy it
        @project = Project.find(params[:id])
        Project.destroy(params[:id])
        #response: redirect to the index page
        redirect_to projects_path
    end
    

end
