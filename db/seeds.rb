require "import_csv"
EMAIL = "test@example.com".freeze
ADMIN_EMAIL = "admin@example.com".freeze
PASSWORD = "password".freeze
SLACK_ID = "00000000".freeze
SLACK_NAME = "other"

if Rails.env.development?
  User.find_or_create_by!(email: EMAIL) do |user|
    user.password = PASSWORD
    user.slack_id = SLACK_ID
    user.slack_name = SLACK_NAME
    user.flag = true
    puts "ユーザーの初期データインポートに成功しました。"
  end
  AdminUser.find_or_create_by!(email: ADMIN_EMAIL) do |user|
    user.password = PASSWORD
    puts "管理者ユーザーの初期データインポートに成功しました。"
  end
  ImportCsv.execute(model: Genre)
end
