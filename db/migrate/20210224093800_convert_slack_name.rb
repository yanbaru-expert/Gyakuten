class ConvertSlackName < ActiveRecord::Migration[5.2]
  def up
    list = {
      gyakuten: 1,
      yanbaru_expert: 2,
      yanbaru_expert_light: 3,
      yanbaru_code: 4,
      php: 5,
    }
    list.each_key do |name|
      User.where(slack_name: name).update(slack_name: list[name])
    end
    User.where(slack_name: nil).update(slack_name: 0)
  end
end
