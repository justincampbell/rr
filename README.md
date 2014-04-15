# rr [![Build Status](https://travis-ci.org/justincampbell/rr.svg?branch=master)](https://travis-ci.org/justincampbell/rr)

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
    brew install rr

## Package

    wget -O rr-latest.tar.gz https://github.com/justincampbell/rr/archive/latest.tar.gz rr
    tar -zxvf rr-latest.tar.gz
    cd rr-latest/
    make install
