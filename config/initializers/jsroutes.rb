# https://github.com/railsware/js-routes#advanced-setup
JsRoutes.setup do |config|
  # Whitelist routes to include on the Front-End
  # NOTE: if you add a new route here, do not forget to run:
  #       rake tmp:cache:clear
  #       before restarting your `rails s`.
  # We don't want to expose too many routes to the browser, hence the reason behind whitelisting
  # on a case by case basis
  config.include = [

  ]
end
