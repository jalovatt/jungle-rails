# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

We were given a functioning app and tasked with implementing several new features:

- A user registration system, complete with secure passwords and cookies.

- A "completed order" screen and confirmation email


## Setup

### Live site

A live version of this project can be found at [http://lighthouse-jungle.herokuapp.com/](http://lighthouse-jungle.herokuapp.com/).

A couple of notes:

- Attempting to process an order through Stripe will fail, as this is site is just for testing purposes.

- Feel free to log in as an Admin to add categories or products - username `Jungle`, password `book`.

- Heroku may not let you upload images for new products, however. Again, this site is just a demo.

1. Clone this repository.
2. Run `bundle install` to install dependencies.
3. Create `config/database.yml` by copying `config/database.example.yml`.
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`.
5. Run `bin/rake db:reset` to create, load and seed the database.
6. Create an .env file based on .env.example.
7. Sign up for a Stripe account.
8. Put your Stripe test keys into the appropriate .env vars.
9. Run `bin/rails s -b 0.0.0.0` to start the server.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for making a test order. Provide an expiration date of any time in the future, and any three digits for the security code.

More information is available in their docs: <https://stripe.com/docs/testing#cards>

## Order Emails

After placing a test order, visit  [http://localhost:3000/rails/mailers/user_mailer/order_email](http://localhost:3000/rails/mailers/user_mailer/order_email) to see a copy of the order email.

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
