rails new blog

cd blog

rake db:create

rails generate controller home index

rails generate scaffold Post name:string title:string content:text

rake db:migrate

-----------------------------------------

cd app/views/home

	index.html.erb

	<%= link_to "My Blog", posts_path %>

config/route.rb

	root :to => 'home#index'

rm public/index.html
-----------------------------------------

	rails	server
-----------------------------------------
<http://guides.rubyonrails.org/getting_started.html>
-----------------------------------------
LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-3.0.9/ext/apache2/mod_passenger.so
   PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-3.0.9
   PassengerRuby /usr/bin/ruby1.8

-----------------------------------------
config.assets.compile = true in config/environments/production.rb
-----------------------------------------
