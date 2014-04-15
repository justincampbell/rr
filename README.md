# retry-and-repeat [![Build Status](https://travis-ci.org/justincampbell/repeat-and-retry.svg?branch=master)](https://travis-ci.org/justincampbell/repeat-and-retry)

## `repeat` Repeats a command until it fails

## `retry` Retries a command until it succeeds

# Options

* `-n <seconds>` override sleep in between commands (defaults to 1 second).

# Examples

    $ retry foo # Retry foo every second until it succeeds
    $ repeat foo # Repeat foo every second until it fails
    $ retry -n 0 foo # Do not wait any time in between retries
    $ retry -n 2.5 foo # Wait 2.5 seconds in between retries

# Installation

## [Homebrew](http://brew.sh)

    brew tap justincampbell/formulae
    brew install repeat-and-retry

## Package

    wget -O repeat-and-retry-latest.tar.gz https://github.com/justincampbell/repeat-and-retry/archive/latest.tar.gz repeat-and-retry
    tar -zxvf repeat-and-retry-latest.tar.gz
    cd repeat-and-retry-latest/
    make install
