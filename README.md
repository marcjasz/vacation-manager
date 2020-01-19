1. Download and install NodeJs, npm, PostgreSQL, Ruby, RubyGems, Yarn
2. Clone the repo
3. Run the following commands
    * enter postgres console with `psql -U postgres`
    * `create role vacation_manager with createdb login password '1234';`
    * exit psql with `\q`
    * `rake db:setup`
    * `rails db:migrate` (run this after adding every database migration)
    * `rails install:webpacker`
4. `rails server` to run the server on localhost:3000