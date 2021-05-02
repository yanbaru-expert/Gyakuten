require "csv"

class ImportCsv
  REGEX = /\A\d+\z/

  def self.execute(model:, file_name: nil)
    model_name = model.to_s.classify
    table_name = model_name.tableize
    file_name ||= table_name.singularize
    path = Rails.root.join("db/csv_data/#{file_name}.csv")

    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h.transform_values {|v| v =~ REGEX ? v.to_i : v }
    end
    # 与えられたモデルに CSVデータを投入
    model_name.constantize.import!(list, on_duplicate_key_update: :all)
    # 次に振る id を正常化
    ActiveRecord::Base.connection.execute("select setval('#{table_name}_id_seq',(select max(id) from #{table_name}))")
  end
end
