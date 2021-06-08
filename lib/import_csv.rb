require "csv"

class ImportCsv
  REGEX = /\A\d+\z/

  class << self
    def execute(model:, file_name: nil)
      model_name = model.to_s.classify
      table_name = model_name.tableize
      file_name ||= table_name.singularize
      # 与えられたモデルに CSVデータを投入
      list = import_csv(file_name)
      model_name.constantize.import!(list, on_duplicate_key_update: :all)
      # 次に振る id を正常化
      ActiveRecord::Base.connection.execute("select setval('#{table_name}_id_seq',(select max(id) from #{table_name}))")
    end

    def image_import(model:, dir_name: nil)
      model_name = model.to_s.classify
      table_name = model_name.tableize
      dir_name ||= table_name.singularize

      model_name.constantize.order(:id).each do |object|
        object.update!(image: open(Rails.root.join("db/fixtures/#{dir_name}/#{object.id}.jpeg")))
      end
    end

    private

    def import_csv(file_name)
      path = Rails.root.join("db/csv_data/#{file_name}.csv")

      list = []
      CSV.foreach(path, headers: true) do |row|
        attributes = row.to_h.transform_values { |v| REGEX.match?(v) ? v.to_i : v }
        attributes.delete("image")
        list << attributes
      end
      list
    end
  end
end
