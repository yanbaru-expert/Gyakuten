require "import_csv"

class ImportGenreAndGenreGroupCsv < ActiveRecord::Migration[5.2]
  def up
    ImportCsv.execute(model: GenreGroup)
    ImportCsv.execute(model: Genre)
  end
end
