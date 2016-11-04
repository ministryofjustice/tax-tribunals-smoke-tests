# Smoke Tests for Tax Tribunals

Some cucumber tests which will confirm that the various components of the Tax Tribunals service
are inter-operating correctly.

Warning: These scripts create and manipulate tribunal cases and their associated fees, so you
probably don't want to target the live production service, when running them.

## Pre-requisites

* Xcode (required to install phantomjs)
* PhantomJS
* Ruby, bundler, etc.

## Installation

After ensuring that all the pre-requisites are installed, checkout the repository and run `bundle install`

## Configuration

Edit `features/env.rb` and change `Capybara.app_host` to point to your instance of the fee payment application

## Running

Execute `cucumber` to run all the tests

