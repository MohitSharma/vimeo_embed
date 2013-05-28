module VimeoEmbed
    class Base
      include HTTParty
      base_uri 'vimeo.com/api/v2'
    end # Base
end # VimeoEmbed