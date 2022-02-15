class TasksController < ApplicationController
  # line below will call #set_task method before specified actions
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    set_task
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
  # 1) GET the HTML form (pre-filled with task attributes) for editing = 1 request

  def edit
    set_task
  end
  # 2) PATCH the parameters to update an existing task = 1 request

  def update
    set_task
    # @task.update(params[:task])
    @task.update(task_params)
    # same as in create the commented out line would raise ActiveModel::ForbiddenAttributesError,
    # that's why we need a private section for protection (we use Strong Params)

    # no need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    set_task
    @task.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  # We made this method to run before edit and create because they have 4 lines in common.
  def set_task
    @task = Task.find(params[:id])
  end
end
