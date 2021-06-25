module DayHelper
  def end_month_info
    Date.current.end_of_month.strftime("%m月").delete_prefix("0")
  end

  def deadline_judge
    # 毎月24日以降にtrue
    Date.current - Date.current.beginning_of_month >= 23
  end
end
