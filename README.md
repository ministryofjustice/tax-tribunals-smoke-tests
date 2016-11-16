# Smoke Tests for Tax Tribunals

Some tests which will confirm that the various components of the Tax Tribunals service
are inter-operating correctly.

## Pre-requisites

* Xcode (required to install phantomjs)
* PhantomJS
* Ruby, bundler, etc.

## Installation

After ensuring that all the pre-requisites are installed, checkout the repository and run `bundle install`

## Configuration

The `env.example` file contains the various environment variables which must be set in order for the
tests to run.

If the values in `env.example` are not suitable, create a copy with the correct values and then
edit the `Makefile` to reference your copy.

## Running

    $ make

