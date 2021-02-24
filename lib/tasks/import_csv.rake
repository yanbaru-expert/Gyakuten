require "import_csv"

namespace :import_csv do
  desc "ジャンルの初期データの投入"
  task genre: :environment do
    ImportCsv.execute(model: Genre)
    puts "ジャンルの初期データの投入に成功しました!"
  end
end
