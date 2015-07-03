require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require "whenever/capistrano"
require 'capistrano/sitemap_generator'
require 'capistrano3/unicorn'
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
