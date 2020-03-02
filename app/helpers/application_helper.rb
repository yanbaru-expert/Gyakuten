module ApplicationHelper
  # title などを埋め込む際は，各ビューファイルに次を埋め込む
  # <% content_for(:title) { タイトル名 } %>
  def default_meta_tags(title:, description:, twitter_image:)
    {
      site: Settings.default.site_name,
      title: title,
      # reverse: false,
      charset: "utf-8",
      description: description.presence || Settings.default.description,
      # keywords: '人生逆転サロン',
      # canonical: 'https://arcane-gorge-21903.herokuapp.com/',
      # separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') }
      # ],
      og: {
        # 例えば，:site とすれば，上記の site: の情報をコピーできる
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.url,
        image: twitter_image.present? ? image_tag(@text.twitter_image): image_url("texts/#{Settings.default.twitter_image}"),
        locale: "ja_JP",
      },
      twitter: {
        card: "summary_large_image",
        site: Settings.default.twitter_site,
      },
    }
  end
end
