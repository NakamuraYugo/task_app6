class TasksController < ApplicationController


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @tasks = Task.all
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :description))
    if @task.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to tasks_index_path
    else
      flash.now[:danger] = "作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tasks = Task.all
    @task = Task.find(params[:id])
  end

  def edit
    @tasks = Task.all
    @task = Task.find(params[:id])
  end

  def update
    @tasks = Task.all
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :strat_date, :end_date, :all_day, :description))
      redirect_to tasks_index_path, success: "スケジュールを更新しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tasks = Task.all
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to tasks_index_path
  end

end
