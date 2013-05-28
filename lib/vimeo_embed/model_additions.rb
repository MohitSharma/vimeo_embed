module VimeoEmbed
  module ModelAdditions
    def vimeo_embed(attribute, options)
      before_validation do
        send("#{attribute}=", VimeoEmbed.vimeo_embed(send(attribute), options))
      end
    end

  end
end