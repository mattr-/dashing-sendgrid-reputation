# dashing-sendgrid-reputation

Display your SendGrid Email Reputation on your Dashing dashboard!

This repo provides a job you can add into your dashboard based on
Dashing to get your email reputation from your SendGrid account.

To use this thing, you'll need to two additional environment variables
to your environment:

- SENDGRID_USERNAME
- SENDGRID_PASSWORD

SendGrid doesn't provide an email to get email reputation, so Mechanize
is used to login and scrape the data off their site. You'll need to
include this as a dependency in your dashboard's `Gemfile`

