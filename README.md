# VimeoEmbed

Embed vimeo videos in on site saving  URL and get relevant output in view

1. Simple Embed

2. Embed with title, description & thumbnail

## Installation

Add this line to your application's Gemfile:

    gem 'vimeo_embed'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vimeo_embed

And add CSS and JS

CSS in application.css

    *= require vimeo_embed

JS in application.js

    //= require vimeo_embed

## Usage

It can be used in model where we can specify simple iframe embed or embedding with thumbnail & description

Simple:

    vimeo_embed :field_name, {:with_description => false, :width => 450, :height => 300}

With Thumbnail & Description:

    vimeo_embed :field_name, {:with_description => true, :width => 450, :height => 300}


This will modify the vimeo link into html required to embed, If you don't want to modify html or simple change the view you can call method in view like this:

    <?=  VimeoEmbed::vimeo_embed(attr_here, {:with_description => true, :width => 450, :height => 300}) ?>


Working on further improvements

## Contributing

vimeo_embed

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
