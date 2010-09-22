# rails_template.rb
#
# set up the databases
rake "db:create", :env => 'development'
rake "db:create", :env => 'test'

# install required gems
gem "haml"
rake "gems:install"
run "haml --rails ."
#
# run nifty generators
generate :nifty_layout, "--haml"
generate :nifty_config

# remove unneeded files from public directory
run "rm public/index.html"
run "rm public/images/rails.png"

# set up git
file ".gitignore", <<-END
 .DS_Store
 log/*.log
 tmp/**/*
 config/database.yml
 db/*.sqlite3
END

 run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
 run "cp config/database.yml config/database.example"

 git :init
 git :add => "."
 git :commit => "-a -m 'create initial application'"
