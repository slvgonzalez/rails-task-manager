class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    @task.save
    # the commented out line would raise ActiveModel::ForbiddenAttributesError that's why we need
    # a private section for protection (we use Strong Params)

    # no need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
  end
  # 2 steps to UPDATE / 2 requests
  # 1) GET the HTML form (pre-filled with restaurant attributes) for editing = 1 request

  def edit
    @task = Task.find(params[:id])
  end
  # 2) PATCH the parameters to update an existing restaurant = 1 request

  def update
    @task = Task.find(params[:id])
    # @task.update(params[:task])
    @task.update(task_params)
    # same as in create the commented out line would raise ActiveModel::ForbiddenAttributesError,
    # that's why we need a private section for protection (we use Strong Params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
