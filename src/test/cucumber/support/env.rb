TEST_DIR = File.dirname(File.dirname(File.dirname(__FILE__)))
APP_DIR = File.join(TEST_DIR, 'app')
app_file = File.join(APP_DIR, 'app')

require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

require 'spec/expectations'
require 'capybara/cucumber'
require 'capybara/session'
require File.join(TEST_DIR, 'cucumber', 'support', 'flash_selenium')
require File.join(TEST_DIR, 'cucumber', 'support', 'flash_helper')

Capybara.default_selector = :css
Capybara.default_driver = :selenium
Capybara.app = PandaUploaderTestApp

World(FlashHelper)