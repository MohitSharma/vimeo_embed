require 'httparty'
require "vimeo_embed/version"
require "vimeo_embed/model_additions"
require "vimeo_embed/base"
require "vimeo_embed/video_details"
require "vimeo_embed/railtie" if defined? Rails
require "vimeo_embed/engine"

module VimeoEmbed

  def self.get_video_id(url)
    url.strip!
    return url.gsub(/https?:\/\/?(?:www\.)?vimeo\.com\/?(\d+)/i, '\1')
  end

  def self.vimeo_embed(data, options = {:with_description => true, :height => 200, :width => 300})
    if data.match(/https?:\/\/?(?:www\.)?vimeo\.com/)
      data = data.gsub(/<a?[^<]+ href="https?:\/\/?(?:www\.)?vimeo\.com\/\d+"?[^<]+>([^<]+)<\/a>/i, '\1')
      if options[:with_description]
        data = data.gsub(/(https?:\/\/?(?:www\.)?vimeo\.com\/\d+)/i, thumbnail_and_description("#{$1}", options[:width], options[:height]))
      else
        data = data.gsub(/(https?:\/\/?(?:www\.)?vimeo\.com\/\d+)/i, simple("#{$1}", options[:width], options[:height]))
      end
    end
    return data
  end

  def self.thumbnail_and_description(video_url, width, height)
    begin
      if video_url.to_s != ' '
        video_id = get_video_id(video_url)
        if video_id.present?
          video_details = VimeoEmbed::VideoDetails.info(video_id)
          return %Q{<div class="vimeo_embed_video">
            <div class="vimeo_embed_partial_video">
              <div class="vimeo_embed_thumbnail">
                <img src="#{video_details[0]["thumbnail_small"] ? video_details[0]["thumbnail_small"] : ""}" />
              </div>
              <div class="vimeo_embed_details">
                <div class="vimeo_embed_title">
                 <strong>
                   #{video_details[0]["title"] ? video_details[0]["title"] : ""}
                 </strong>
                </div>
                <div class="vimeo_embed_description">
                  #{video_details[0]["description"] ? video_details[0]["description"].truncate(185) : ""}
                </div>
              </div>
            </div>
            <div class="vimeo_embed_main_video" style="display:none;">
              <iframe title="Vimeo player" width="#{ width }" height="#{ height }" src="http://player.vimeo.com/video/#{ video_id }" frameborder="0" allowfullscreen></iframe>
            </div>
          </div>}
        else
          return video_url
        end
      end
    rescue Exception => e
      Rails.logger.debug e.message
    end
  end

  def self.simple(video_url, width, height)
    begin
      if video_url.to_s != ' '
        video_id = get_video_id(video_url)
        if video_id.present?
          return %Q{<div class="vimeo_embed_video"><iframe title="Vimeo player" width="#{ width }" height="#{ height }" src="http://player.vimeo.com/video/#{ video_id }" frameborder="0" allowfullscreen></iframe></div>}
        else
          return video_url
        end
      end
    rescue Exception => e
      Rails.logger.debug e.message
    end
  end

end
