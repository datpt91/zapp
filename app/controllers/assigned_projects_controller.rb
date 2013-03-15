class AssignedProjectsController < ApplicationController

  before_filter :admin_user

 def new
    @assigned_project = AssignedProject.new
    @users = User.all
    @projects = Project.all

    respond_to do |f|
      f.html
      f.json { render json: @assigned_project }
    end
  end

def edit
    @assigned_project = AssignedProject.find(params[:id])
    @users = User.all
    @projects = Project.all
  end

 
  def create
    @assigned_project = AssignedProject.new(params[:assigned_project])

    respond_to do |f|
      if @assigned_project.save
        f.html { redirect_to @assigned_project, notice: 'Assigned successfully!' }
        f.json { render json: @assigned_project, status: :created, location: @assigned_project }
      else
        f.html { render action: "new" }
        f.json { render json: @assigned_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @assigned_project = AssignedProject.find(params[:id])

    respond_to do |format|
      if @assigned_project.update_attributes(params[:assigned_project])
        format.html { redirect_to @assigned_project, notice: 'Assigned successful.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assigned_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @assigned_projects = AssignedProject.all
    @users = User.all
    @projects = Project.all

    respond_to do |f|
      f.html 
      f.json { render json: @assigned_projects }
    end
  end


  def show
    @assigned_project = AssignedProject.find(params[:id])
    @users = User.all
    @projects = Project.all

    respond_to do |f|
      f.html 
      f.json { render json: @assigned_project }
    end
  end

 

  

  def destroy
    @assigned_project = AssignedProject.find(params[:id])
    @assigned_project.destroy

    respond_to do |f|
      f.html { redirect_to assigned_projects_url }
      f.json { head :no_content }
    end
  end

  def admin_user
    if !current_user.admin?
      flash[:notice] = "Invalid request"
      redirect_to(home_path) 
    end
  end
end

