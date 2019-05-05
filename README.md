# Backend

[![Build Status](https://travis-ci.org/splay-project-v2/backend.svg?branch=api_redesign)](https://travis-ci.org/splay-project-v2/backend)

The Splay Backend is the interface between the Splay *Controller* and
the web application, offering RESTapi in order to control the whole
application.

## Made with love following good principles

- [JSON API Specification](https://jsonapi.org/) for building our API
- [RuboCop](https://github.com/rubocop-hq/rubocop) for code analyzer, sanitizer and formatter
- [Rspec](http://rspec.info/) as our main testing framework


## Tasks

These are the tasks performed and to be performed on Backend

- [x] DB definition and versioning belongs to Backend
- [x] Transform Backend in a small Rails API app
- [x] Immediately setup Rubocop and Rspec
- [x] CircleCI or TravisCI integration
- [x] Recreate DB Schema using migrations
- [x] Tests on models
- [ ] API entries for the listed routes in `api.raml`
- [x] JSON API is tested

## README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## How to 

If you launch this component with docker, don't forget to choose a environment variable call MASTER_KEY used to generate secure json web token.