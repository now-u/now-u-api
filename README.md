## Welcome! :wave:

This is the official repository for the now-u Web Application. now-u is a non-profit started by James and Lizzie Elgar, aimed at driving positive change through coordinated monthly campaigns and actions. Volunteers from all over the world contributed to now-u, and are continuing to do so today, from app and web development, through designing and marketing. If you are reading this, there is a possibility you are a volunteer who has just been onboarded onto the API Team, and if this is the case, keep on reading!

## Development :computer:

Whether you were formally onboarded onto the now-u team, or would like to contribute to some open source, now-u is extremely grateful for any input you may have, so firstly a massive THANK YOU! Although, if you are looking at contributing, please follow some code guidelines to ensure that this repository is kept clean for other contributors and volunteers. 

1. Pick an issue of your choosing from the `issues` tab on this Github repository. If there is no-one assigned to an issue, ask @JElgar or @stellenberger to assign you, or assign yourself and let us know on slack. 
2. Once you get started set it as "in-progress"
3. Make a branch (off `master`) called either "feature/description" or "bugfix/description"
4. Make the required changes
6. When you create a Pull Request, always Pull Request into the `master` branch. 
7. When you submit a Pull Request, assign @JElgar or @stellenberger to conduct a Code Review, or any other colleagues that are in the team. 

### Setup :hammer:

#### Docker (Recommended)

Prerequisites: 

- `docker`
- `docker-compose`
- `make`

#### Local
1. First clone this repo. Prerequisites include Ruby version 2.5.0 and Ruby on Rails 5.2.3, as stated in the Gemfile at the time of writing this. 
2. Make sure you are on the `master` branch
3. Run the following commands
```
$ gem install bundler:2.0.2
```
then...
```
$ bundle install
```
then...
```
yarn install
```
then...
```
rails db:create
```
then...
```
rails db:migrate
```

### Where to start? :information_desk_person:

To find out what needs doing checkout the [issues](https://github.com/now-u/now-u-api/issues). Select an issue that looks interesting to you and double check its not been assigned/in-progress. Issues have priorities but the real priority is what you find interesting.

## Notes :memo:

The endpoints for this repo is https://api.now-u.com/api/v1/campaigns (replace campaigns with whatever endpoint you need)

To make swagger api documentation, run the following command

`SWAGGER_DRY_RUN=0 RAILS_ENV=test rails rswag`

## Sentry

RAILS_ENV=production || staging