class ProjectsController < ApplicationController
  
  def new
    @project = Project.new

    respond_to do |f|
      f.html 
      f.json { render json: @project }
    end
  end

  def index
    @projects = Project.all

    respond_to do |f|
      f.html 
      f.json { render json: @projects }
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |f|
      f.html 
      f.json { render json: @project }
    end
  end

  

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |f|
      if @project.save
        f.html { redirect_to @project, notice: 'Create successfully!' }
        f.json { render json: @project, status: :created, location: @project }
      else
        f.html { render action: "new" }
        f.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end


end
