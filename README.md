# README

![Build Status](https://codeship.com/projects/cba47870-99b9-0135-7534-42741cf973da/status?branch=master)
![Code Climate](https://codeclimate.com/github/maxsean/yana.png)
![Coverage Status](https://coveralls.io/repos/maxsean/yana/badge.png)

# YANA
An online forum for patients with chronic illnesses

## Introduction
This project was created in two weeks by a single junior web developer. The goal was to provide a support service for chronically ill patients outside the hospital. Users can sign up to post on forums to share stories, ask for help, or bring attention to medical news. Users can also partake in surveys that capture demographic data. They can then explore their community's data with an interactive visualization.

## Technologies
* Ruby on Rails: back-end mainly used for API endpoints
* React.js and React-Router: for quick and responsive user experience
* D3.js: visualization of submitted survey data
* Capybara: testing Rails components and features
* Jasmine-Enzyme: testing React components and features

## Setup
In app directory, run:
```
bundle install
rake db:create
rake db:migrate
rake db:seed
rake db:test:prepare
rails s
```
In a separate terminal tab, run:
```
yarn install
./bin/webpack-dev-server
```
Then navigate to `localhost:3000`.

If you want to demo the product without signing up, you may use the username: "testuser" with password: "123456".

For Capybara tests run `rake`
and for Jasmine-Enzyme tests run `karma start`.

## ToDo
* External API integration with ClinicalTrials.gov
* External API integration with an open-source Health Information System (i.e. OpenMRS)
* Search filters for posts
* Search filters for submitted survey data
* Edit functions for posts and comments
* Robust user verification process to screen for patients, medical professionals, friends, and family members
* Add moderator and administrator roles
* Forum maker for administrators
* Survey maker for moderators and administrators
* Add badges for users to distinguish karma standing and role in community (patient, medical professional, friend, family)
