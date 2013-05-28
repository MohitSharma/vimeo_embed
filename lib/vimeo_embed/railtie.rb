module VimeoEmbed
  class Railtie < Rails::Railtie
    initializer 'vimeo_embed.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end