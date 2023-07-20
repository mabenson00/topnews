# Set Up
* with RVM or rbenv install and set version to `3.2.0` (if easier, change `.ruby-version` to your version and bundle install)
* `rake db:create && rake db:migrate && rake db:seed`
* open two terminal windows and run `bundle exec sidekiq` in one, `rails s` in the other
* login with the seeded user, eg: `LawrenceWGrant@example.com`, `ahR7iecai`


<img width="1175" alt="image" src="https://github.com/mabenson00/topnews/assets/22816934/798b60e6-9aa6-4809-88a2-4846a63ae15a">

## Details
* The top articles list is pulled from the API every minute, which then `find_or_creates` the record in the db with `uuid` equal to `id` on the hacker news side. then a job gets triggered that hits the other api and fills in/updates the details.
* To see who favorited each article on the right oclumn, hover over the second line.
* Include `?limit=XX` in the URL to change the number of articles shown on the page, default 20.

  
## Notes
* Full tests arent necessary in this scenario, because its an admin tool that has no effect on the business, but if i were to do this I would add a couple to make sure the page at least loads.
* I think the API calls are pretty ok performancewise, but I'd change the timer to every 10 minutes instead of every minute.
* Things to do: make sure this works if the api returns something weird. eg: what happens if the score is nil?

## To do:
* add the site name (or base url) like on actual hackernews
* test that error handler...
