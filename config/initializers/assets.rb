Rails.application.config.assets.precompile += %w[static_pages.scss design.scss php_lp.scss contents.js Sortable.min.js memo.js design.js php.js text_image.js]

Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.paths << Rails.root.join("node_modules")
