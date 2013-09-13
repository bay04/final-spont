class ProjectsController < ApplicationController


# Setting the project by finding it only for these actions
	before_action :set_project, only: [:show, :edit, :update, :destroy]
# Authorizing so no access
	before_filter :authorize
# Making sure creator only can edit
	before_action :editable?, only: [:edit, :destroy]
# Make sure a user can view his own projects only
	before_action :can_view?, only: [:show]


def new
	@project = Project.new
end

def create
	@project = Project.new(project_params)
#Pass the user id to the project as it is created	
	@project.user_id = current_user.id
		if @project.save
			redirect_to @project
			flash[:notice] = "Project has been created!"
		else
			render 'new'
		end
end


def show	
end

def edit
end

def update
	if @project.update(project_params)
		redirect_to @project
		flash[:notice] = "Project was updated, thank you."
	else
		render 'edit'
	end

end

def destroy
	@project.destroy
	redirect_to root
	
end


private

	def editable?
		@p = @project.user_id
		@u = current_user.id

		if @p == @u
			render 'edit'

		else
		flash[:notice] = "Can't edit this!"
			 render 'public/500'
		end
	end



	def can_view?
		if @project.user_id == current_user.id
			
			
		else
			render 'public/404'
			flash[:notice] = "Can't view this"
		end
	end


	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :description, :budget, :user, :category_of_work, :approval)
	end
end
