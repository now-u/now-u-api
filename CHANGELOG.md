# now-u app changelog

### Types of changes

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for soon-to-be removed features.
- `Removed` for now removed features.
- `Fixed` for any bug fixes.
- `Security` in case of vulnerabilities.

The above is taken from: https://keepachangelog.com/en/1.0.0/

## The log

### Unreleased: 

- #36 [feature] Split the web and app sign in endpoints that are sent in the email (untested)
- #37 [Added] Created an endpoint to toggle the user Mailchimp subscription
- #38 [Changed] Configured posts order by created_at
- #39 [Added] Created an endpoint to check if the app version is still compatible or not
- #49 [Added] Method to Notification model to release notification to all Users. 

### V2 Unreleased

- #xxx [Added] Added request specs
- #xxx [Added] RSwag API documentation generated from request specs
- #xxx [Added] V2 API controllers with endpoints, Campaign, Action, Causes, User Actions, User Campaigns
- #xxx [Added] V2 API controllers consume tokens in headers for user specific information in response object
- #xxx [Added] Added filter pattern that consumes a specific model-filter module, CampaignFilter, CampaignActionFilter

### Version 1.7.39

- #338 [Changed] Configured Rubocop (Ruby Linter) and fixed some low hanging fruit
