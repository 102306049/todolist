class TodosController < ApplicationController
	def index
		if params[:finishOrNot].blank?
			@todos=Todo.all
		end
		if params[:finishOrNot].present?
			@todos=Todo.where(:finishOrNot => true)
		end
		if params[:finishNot].present?
			@todos=Todo.where(:finishOrNot => false)		
		end
	end

	def new
		@todo = Todo.new
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def create
		@todo=Todo.new(todo_params)
		if @todo.save
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@todo=Todo.find(params[:id])
		@todo.destroy
		redirect_to root_path
	end

	def finish
		@todo=Todo.find(params[:id])
		if @todo.finishOrNot == false
			@todo.update_attributes(finishOrNot: true)
			redirect_to root_path
		else
			@todo.update_attributes(finishOrNot: false)
			redirect_to root_path
		end
	end

	private
	def todo_params
		params.require(:todo).permit(:content, :finishOrNot)
	end

end
