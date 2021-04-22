module ApplicationHelper
  # title などを埋め込む際は，各ビューファイルに次を埋め込む
  # <% content_for(:title) { タイトル名 } %>
  def default_meta_tags(title:, description:, twitter_image:)
    og_title = if title.present?
                 "やんばるエキスパート教材 | #{title}"
               else
                 "やんばるエキスパート教材"
               end
    og_image = if twitter_image.present?
                 twitter_image
               elsif params[:genre].in?(Genre::DESIGN) || request.path.in?(["/design", "/design_success"])
                 "https://d5izmuz0mcjzz.cloudfront.net/yanbaru_expert_banner_design.jpg"
               else
                 "https://d5izmuz0mcjzz.cloudfront.net/yanbaru_expert_banner.jpg"
               end
    {
      site: Settings.ogp.site_name,
      title: title,
      # reverse: false,
      charset: "utf-8",
      description: description.presence || Settings.ogp.default_description,
      # canonical: 'https://www.yanbaru-code.com/',
      # separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') }
      # ],
      og: {
        # 例えば，:site とすれば，上記の site: の情報をコピーできる
        site_name: :site,
        title: og_title,
        description: :description,
        type: "website",
        url: request.url,
        image: og_image,
        locale: "ja_JP",
      },
      twitter: {
        card: "summary_large_image",
        site: Settings.ogp.twitter_site,
      },
    }
  end

  def add_disabled
    " disabled" unless user_signed_in?
  end

  def display_name(genre)
    @convert_display_name[genre]
  end
end
