class TasksController < ApplicationController

    def index
        @tasks = params[:status].nil? ? Task.all : Task.where(status: params[:status])
        @today_tasks = Task.where(end_date: Date.today).where.not(status: "complate")
        @delay_tasks = Task.where(end_date: (..Date.yesterday)).where.not(status: "complate")
        @tags = Tag.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new
        @task.attributes = params.require(:task).permit(:title, :body, :start_date, :end_date, :status, tag_ids: [])
        @task.save!

        redirect_to task_path(@task)
    rescue ActiveRecord::RecordInvalid
        render action: :new, status: :unprocessable_entity
    end

    def show
        @task = Task.find params[:id]
    end

    def edit
        @task = Task.find params[:id]
    end

    def update
        @task = Task.find params[:id]
        @task.attributes = params.require(:task).permit(:title, :body, :start_date, :end_date, :status, tag_ids: [])
        @task.save!

        redirect_to task_path(@task)
    rescue ActiveRecord::RecordInvalid
        render action: :new, status: :unprocessable_entity
    end

    def destroy
        @task = Task.find params[:id]
        @task.destroy
        redirect_to tasks_path
    end

end
