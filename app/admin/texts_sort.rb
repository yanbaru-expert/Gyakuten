ActiveAdmin.register_page "TextSort" do
  # トップメニュー「テキスト教材」の下に「並び替え」という名前のドロップダウンを追加
  menu parent: "テキスト教材", label: "並び替え"

  page_action :update, method: :patch

  content do
    render partial: "admin/texts_sort"
  end

  controller do
    def index
      @texts = Text.order(:position).includes(:genre)
      @text_ids = Text.ids
    end

    def update
      @text = Text.find_by(position: params[:from].to_i)
      @text.insert_at(params[:to].to_i)
    end
  end
end
