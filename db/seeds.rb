require "import_csv"

ImportCsv.execute(model: Genre)
ImportCsv.execute(model: Lecture)
puts "ジャンルの初期データインポートに成功しました。"

return unless Rails.env.development?

ImportCsv.execute(model: Faq)
puts "FAQの初期データインポートに成功しました。"
ImportCsv.execute(model: MemoExample)
puts "メモの例の初期データインポートに成功しました。"

ImportCsv.execute(model: DesignTaskCategory)
ImportCsv.image_import(model: DesignTaskCategory)
ImportCsv.execute(model: DesignTaskList)

email = "test@example.com".freeze
admin_email = "admin@example.com".freeze
password = "password".freeze
slack_id = "00000000".freeze
slack_name = "other"

User.find_or_create_by!(email: email) do |user|
  user.password = password
  user.slack_id = slack_id
  user.slack_name = slack_name
  user.flag = true
  puts "ユーザーの初期データインポートに成功しました。"
end

AdminUser.find_or_create_by!(email: admin_email) do |user|
  user.password = password
  puts "管理者ユーザーの初期データインポートに成功しました。"
end

ImportCsv.execute(model: Text)
ImportCsv.image_import(model: Text)
puts "テキスト教材の開発用初期データインポートに成功しました。"
ImportCsv.execute(model: Movie)
puts "動画教材の開発用初期データインポートに成功しました。"
puts "【注意】開発用ですので，データの内容は制限しております"
