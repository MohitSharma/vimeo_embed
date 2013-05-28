module VimeoEmbed
  class VideoDetails < VimeoEmbed::Base
    # Returns video information
    #
    # @param [String] video_id The vimeo video's id.
    def self.info(video_id)
      get("/video/#{video_id}.json")
    end

  end
end