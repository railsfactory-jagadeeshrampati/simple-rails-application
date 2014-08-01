class TasksController < ApplicationController
 def index
    @task = Task.where(user_id: current_user.id)
 end
  def show
     @task = Task.find(params[:id])
  end
  
  def  new
     @task = Task.new
  end

  def  create
      @task = Task.new(params[:task].permit(:name,:status))
      @task.user = current_user
     if @task.save
        redirect_to tasks_path, :notice => "your task has been saved"
     else
         render "new"
     end

  end

  def  edit
     @task = Task.find(params[:id])
  end

  def  update
      @task = Task.find(params[:id])
      
       if @task.update_attributes(params[:task].permit(:name,:status))
        redirect_to tasks_path, :notice => "your task has been updated"
       else
        render "edit"
       end
    
  end
 
  def mark
       @task = Task.find(params[:task_id])
       @task.update(:status => "Completed")
       redirect_to tasks_path, :notice => "your task has been marked as completed"     
  end

  def  destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path, :notice => "Task has been deleted"
  end
end
