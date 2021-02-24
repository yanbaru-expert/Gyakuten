require 'import_csv'
EMAIL = 'test@example.com'
ADMIN_EMAIL = "admin@example.com"
PASSWORD = 'password'
SLACK_ID = '00000000'

if Rails.env.development?
  User.find_or_create_by!(email: EMAIL) do |user|
    user.password = PASSWORD
    user.slack_id = SLACK_ID
    puts 'ユーザーの初期データインポートに成功しました。'
  end
  AdminUser.find_or_create_by!(email: ADMIN_EMAIL) do |user|
    user.password = PASSWORD
    puts '管理者ユーザーの初期データインポートに成功しました。'
  end
  ImportCsv.execute(model: Genre)
end