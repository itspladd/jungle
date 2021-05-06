# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

I worked on Jungle as a way to simulate the real-world situation of inheriting an existing codebase and being asked to add features and tests to it. Here's a few highlights from the features I added!

## Core Feature Highlights

### Order Summary Page

The Order page shows users a nicely-formatted list of their purchases when their order is confirmed:

<img src="https://github.com/itspladd/jungle/blob/master/docs/order_summary.gif" alt="An animated demonstration of the order-review process.">

### User Registration and Login

I added the ability for visitors to create an account and log in. The site validates that their input email and password match the confirmation dialogs, and prevents multiple users from signing up with the same email address!

<img src="https://github.com/itspladd/jungle/blob/master/docs/user_login.gif" alt="An animated demonstration of the user login process, demonstrating password and email confirmation behavior.">

### Testing with RSpec

For most of the new features, I used a test- and behavior-driven development (BDD) approach, writing tests for each feature before writing the feature itself. I also included testing with Capybara and Poltergeist to run feature tests on the site itself and take verification screenshots!

## Advanced Features

These features will be a bit more complicated to implement, and I hope to work on them soon.

### Email Receipts (TODO)

When an order is successfully placed, an email receipt should be sent to the recipient's email address.

### Product Ratings (TODO)

Users should be able to rate, comment on, and view ratings of products.

### Inventory Adjustment (TODO)

After an order is successfully placed, the quantity for each product that was in the order should be reduced by the appropriate amount.

## Setup

### Prerequisite Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

### General Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

### Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
