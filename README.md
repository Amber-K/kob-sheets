# Kingdom of Betrayal Character Sheets

This system allows players of the Kingdom of Betrayal tabletop roleplaying game to store personal character sheets for their games.

## Local Setup

There are a few steps that you must go through to begin local development.

### Tech Stack

The core tech stack is Ruby 2.7.2 on Rails 6.1.4 with a PostgreSQL 13.3 database, so you must install similar versions of these. Install [Ruby](https://www.ruby-lang.org/en/downloads) first, followed by [PostgreSQL](https://www.postgresql.org/download). Finally, in your command line, clone a git repository for the application with this command:

* `git clone https://github.com/Amber-K/kob-sheets.git`

Rails will be installed at a later step along with all the project's other dependencies, which are known as Ruby gems.

### Environment Variables

You will need to input your PostgreSQL local database urls as environment variables in a private file you create called _.env_. These urls are private because they must incorporate your local PostgreSQL username and password. (If you have not created specific PostgreSQL users yet, the default PostgreSQL username and password are both `postgres`.) The environment variable names are listed below. See the _.env.example_ file if you are not sure how the url declarations should be laid out.

* `DATABASE_URL_DEV`
* `DATABASE_URL_TEST`

### Command Line Execution

Using your command line, navigate to your git repository for the project. You may then enter the commands below to install Rails and all other required gems, and finally build your local database.

* `bundle install`
* `rails db:setup`

At this stage, you will be able to run your complete, local instance of the application with this command:

* `rails s`

## Heroku Deployment

This application has staging and production environments hosted on Heroku. The [staging website](https://kob-sheets-staging.herokuapp.com) is for deployment tests, and the [production website](https://kob-sheets.herokuapp.com) is the one distributed to users. While you have your git repository open in the command line, you can enter these commands to create named remotes to the staging and production environments.

* `heroku git:remote -a kob-sheets-staging`
* `git remote rename heroku staging`
* `heroku git:remote -a kob-sheets`
* `git remote rename heroku production`

Once these remotes have been made, you can deploy to the staging and production environments from your repository at any time using the commands below, assuming you have been added as a Heroku collaborator:

* `git push staging`
* `git push production`

2021 Amber Kolar
