# Set Up
* with RVM or rbenv install and set version to `3.2.0` (if easier, change `.ruby-version` to your version and bundle install)
* `rake db:create && rake db:migrate && rake db:seed`
* open two terminal windows and run `bundle exec sidekiq` in one, `rails s` in the other
* login with the seeded user, eg: `LawrenceWGrant@example.com`, `ahR7iecai`


## Requirements

* Users should sign in. We have created a User model for you and pre-populated it with several users.
* Users should come to a page and see a list of current top Hacker News stories.
* This list does not necessarily need to be the current live list, but it should be a recent and continuously updated list.
* The number of stories displayed is up to you.
* The user should be able to star a story. The mechanism and display is up to you: flag, star, upvote, pick, etc. The UX is your choice.
* The stories chosen by the team members should display. It can be a separate page or the same page, the choice is yours.
* Each story should show the name of the team member or members who flagged it.
* As an internal tool for a small team, performance optimization is not a requirement.
* Be prepared to discuss known performance shortcomings of your solution and potential improvements.
* UX design here is of little importance. The design can be minimal or it can have zero design at all.
