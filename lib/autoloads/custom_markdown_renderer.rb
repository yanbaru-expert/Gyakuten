require "rouge/plugins/redcarpet"

class CustomMarkdownRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def table(header, body)
    "<table class='table table-striped table-bordered'>" \
    "<thead>#{header}</thead>" \
    "<tbody>#{body}</tbody>" \
    "</table>"
  end

  def image(link, _title, content)
    alt = content.present? ? "alt=\"#{content}\" " : nil
    "<img src=\"#{link}\" #{alt}class=\"markdown\">"
  end

  def block_code(code, options)
    # ```options
    # code
    # ```
    # というマークダウンの書き方への対応
    filename, language = split_file_and_lang(options)

    # 元のコードほぼ引用
    # https://github.com/rouge-ruby/rouge/blob/b8a2c9df24817b28303f9aad449524fdd7261416/lib/rouge/plugins/redcarpet.rb
    lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::PlainText
    code.gsub!(/^    /, "\t") if lexer.tag == "make"
    formatter = rouge_formatter(lexer)
    result = formatter.format(lexer.lex(code))

    # ファイル名が存在しなければ変更無し，ファイル名があればコードブロックの上に表示
    return result if filename.blank?

    %(<div class='highlight-info'>
        <span class='highlight-info__inner'>#{filename}</span>
      </div>
      #{result}
    )
  end

  private

  def split_file_and_lang(options)
    # options は４通りの形式に対応できるようにする
    # 1. 無し
    # 2. html
    # 3. app/views/layouts/application.html.erb
    # 4. html:app/views/layouts/application.html.erb
    if options.blank?
      # 1. options が無いケース
      filename = nil
      language = "md"
    else
      # 2 〜 4 のケース
      array = options.split(":")
      if array[0].include?(".")
        # 3. app/views/layouts/application.html.erb のケース
        filename = array[0]
        language = array[0].split(".")[-1]
      elsif array.length > 1
        # 4. html:app/views/layouts/application.html.erb のケース
        filename = array[1]
        language = array[0]
      else
        # 2. html のケース
        filename = nil
        language = array[0]
      end
    end
    [filename, language]
  end
end
