activate :autoprefixer

activate :contentful do |f|
  f.access_token = '4c2dfd071ade84db657f6200ef43ea8c89825dab0521e764105e6ee6b3adbb9e'
  f.space = { space: 'aalxfiwbordy' }
  f.content_types = { events: 'event' }
end

set :relative_links, true
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :layout, "layouts/application"

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/feed.xml", layout: false

configure :development do
  activate :livereload
end

configure :build do
  activate :relative_assets
end
