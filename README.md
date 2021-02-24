* Ruby version: 2.5.8

### Database

After cloning the repo run the following commands to set up the database:

Development
>`bundle install`  
>`rake db:create`  
>`rake db:migrate`  
>`rails s`  

Testing
>`bundle install`  
>`rake db:create`  
>`RAILS_ENV=test rake db:migrate`  
>`rspec`  

Get full descriptions of tests
>`rspec -fd`  

