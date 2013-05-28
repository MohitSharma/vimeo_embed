module VimeoEmbed
  class Engine < ::Rails::Engine
    initializer 'vimeo_embed.load_static_assets' do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/vendor"
    end
  end
end
