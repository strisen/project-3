# README
## Deployment
Heroku link: https://p3bling.herokuapp.com/

## Introduction
Imagine when your engagement plans go awry, and your relationship breaks down. At that point, you probably are still left with a ring that you just bought recently, but are unable to get a buyback value even remotely close to the price that you bought it at. Our site hopes to be a platform to address that problem, by linking up buyers hoping to get a good deal for next-to-brand-new rings with sellers hoping to salvage the value of their rings that they no longer have any use for, resulting in a win-win situation for both parties.

## Objective
To provide an affordable and safe platform for buyers and sellers of jewellery to purchase and sell their jewellery at better rates than they are offered at retailers.

## How it Works
In our site, prospective buyers and sellers can view listings without registering, but must register an account if they want to engage in any form of transaction on our site. Once registered, users can make purchases, list items for sale and communicate directly with the other user they are buying from or selling to.

All transactions on our site are made through E-credits. Buyers have to convert their cash into credits through our website, and use those credits to purchase products from our store.



## Getting Started

### Prerequisites

This project is built with [Ruby on Rails](http://rubyonrails.org/) and [PostgreSQL](https://www.postgresql.org/) with a Model-View-Controller (MVC) architecture.

### How to Use

Fork and clone this repository into your own directory. Install the Gem files used in this project by entering the following code in your terminal:

``bundle install``

following that run the following code"
``rails db:migrate``
and then
``rails s`` to start your server



## ERD

![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/finalerd.png)

## Flowchart
![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/finalflowchart.png)

## User Stories
* As a newly minted single who wants to sell his recently bought engagement ring, I want a place to sell my relatively new ring at a price that more competitive than those currently being offered by pawnshops.

* As a recently engaged person who needs a good engagement ring but is unable or unwilling to spend money on a ring, I want a place to buy a relatively new ring of high quality at a more reasonable price.

* As a husband who wants to get high quality jewellery below the market rate for his wife, I want a marketplace to make such purchases.

* As a young female who is attending a high class function but does not have the financial ability to purchase high-grade jewellery, I want a platform to procure genuine jewellery of reasonable quality at a big discount from prices being offered by retailers.

* As a housewife in urgent need of cash, I need a platform to sell my jewellery at better rates than that being offered to me at pawnshops.

## Development Log

**17 Jan 2018**
* Came out with the idea of Cash My Bling

**19 Jan 2018**
* Add README with user stories, use case, ERD and wireframe

**21 Jan 2018**
* Add working home page
* First push onto Heroku

**22 Jan 2018**
* Further touched up on existing pages

**23 Jan 2018**
* Added Devise to facilitate the registration and login process for users
* Edit our ERD diagram
* Created models based on our edited ERD diagram

**24 Jan 2018**
* Added products controller

**24 Jan 2018**
* Added purchases controller
* Modified products controller

**27 Jan 2018**
* Added Stripe payments system
* Added charges controller and transaction model

**28 Jan 2018**
* Experimented with a shopping cart model

**29 Jan 2018**
* Discarded shopping cart model
* Ensured that the pages worked and CRUD functionality is present
* Finalized the methods for all controllers until this point

**30 Jan 2018**
* Added notifications to users when purchases are made
* Added statuses for products
* Added approval controller

**31 Jan 2018**
* Improved CSS
* Added sorting and pagination

**1 Feb 2018**
* Further touched on the CSS and functionality
* Cleaned up the code

## Wireframes
![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/home.png)

![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/about.png)

![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/store.png)

![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/uploaditem.png)

![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/register.png)

![alt text](https://github.com/empludo/project-3/blob/master/app/assets/images/login.png)




* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
