class MoviesController < ApplicationController
  def index
    @code_name = Genre.valid_code_name(params[:genre])
    @genre = Genre.convert_display_name(@code_name)
    if user_signed_in?
      @movies = Movie.fetch_from(@code_name, params[:page]).includes(:progresses)
    else
      @movies = Movie.fetch_from(@code_name, params[:page])
    end
    @task_lists_initial = DesignTaskList.all  # チェックリスト用に追加
    @task_lists_sorted = @task_lists_initial.sort{|a,b|
      a.design_task_category <=> b.design_task_category
    }
    # @task_lists = Array.new(10).map{Array.new(2,0)}
    array=[]
    @task_lists=[]
    @task_lists_sorted.each_with_index do |task,i|
      if(array.length == 0) then
        array.push task
      else
        if(array.last.design_task_category_id == task.design_task_category_id) then
          array.push task
        else
          @task_lists.push array
          array = []
          array.push task
        end
      end
    end
    @task_lists.push array
    
    @categories = DesignTaskCategory.all # チェックリスト用に追加
  end
end
