source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0.0.1'
gem 'puma'
gem 'pg'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'devise'
gem 'redis'

gem 'sass-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'simple_form'
gem 'autoprefixer-rails'

# FOR IMAGES
gem 'cloudinary', '1.1.0'
gem 'carrierwave', '0.11.2'

# FOR FAKE DATA
gem 'faker'

# FOR GEOCODING
gem 'geocoder'
gem 'coffee-rails'
gem 'gmaps4rails'

source 'https://rails-assets.org' do
  gem "rails-assets-underscore"
end

# FOR REACTJS
gem 'js-routes', '~> 1.3'
gem 'react-rails', '~> 1.8'
source 'https://rails-assets.org' do
  gem 'rails-assets-classnames'
end

# FOR ITEM LIKES
gem 'acts_as_votable'

# FOR RAILS ADMIN
gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin', '>= 1.0.0.rc'

# FOR FACEBOOK CONNECT
gem 'omniauth-facebook'

# FOR CALENDAR BOOKINGS
gem "simple_calendar", "~> 2.0"
gem "validates_overlap"


group :development, :test do
  # THOSE TWO ALLOW TO SIMULATE A NAVIGATOR (INTEGRATION TESTING) - POLTERGEIST REQUIRES FIRST A "brew install phantomjs"
  gem 'capybara'
  gem 'poltergeist'
  # ALLOWS TO GENERATE NAVIGATION PREVIEW SCREENSHOTS
  gem 'launchy'
  # COLORS TESTS IN THE TERMINAL
  gem 'minitest-reporters'

  gem 'binding_of_caller'
  gem 'better_errors'

  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rake'

  # TO ALLOW THE USE OF FACTORIES INSTEAD OF FIXTURES
  gem 'factory_girl_rails', '~> 4.0'

  # FOR BEHAVIOUR-DRIVEN DEVELOPMENT
  gem 'rspec-rails', '~> 3.5'
end

# TO AVOID CAPYBARA LOADING PAGES WHILE FACTORIES SEEDING NOT YET DONE (cf http://technotes.iangreenleaf.com/posts/the-one-true-guide-to-database-transactions-with-capybara.html)
group :test do
  gem 'transactional_capybara'
end


