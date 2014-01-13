#
# Build script for MarkTrapp.com
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013 Mark Trapp
# License:: MIT

npm_bin = `npm bin`.chomp

desc 'Install the necessary dependencies for building the website.'
task :install do |t|
  sh 'npm install'
  sh "#{npm_bin}/bower install"
end

desc 'Regenerate the website files and place them into _site.'
task :build do |t|
  target = '_site'
  prep = '_prep'

  rm_rf target
  sh 'bundle exec jekyll build'
  mkdir_p ["#{target}/assets/css", "#{target}/assets/images", prep]

  lessc = "#{npm_bin}/lessc --no-color"

  # group-css-media-queries requires uncompressed CSS, so run lessc again after
  #   group-css-media-queries to compress it.
  sh "#{lessc} assets/less/main.less > #{prep}/main.css"
  sh "#{npm_bin}/group-css-media-queries #{prep}/main.css #{prep}/main.css"
  sh "#{lessc} --compress #{prep}/main.css > #{target}/assets/css/main.css"

  cp_r 'assets/images', "#{target}/assets"
  rm_rf prep
end
