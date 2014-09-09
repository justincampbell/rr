# rr [![Build Status](https://travis-ci.org/justincampbell/rr.svg?branch=master)](https://travis-ci.org/justincampbell/rr)

## `repeat` Repeats a command until it fails

## `retry` Retries a command until it succeeds

# Options

    -c <count>    limit the number of times the command is run
    -n <seconds>  override sleep in between commands (defaults to 1 second)
    -r            clear the screen before each command run
    -q            hide timestamps

# Examples

    $ rr retry foo # Retry foo every second until it succeeds
    $ rr repeat foo # Repeat foo every second until it fails
    $ rr retry -n 2.5 foo # Wait 2.5 seconds in between retries
    $ rr retry -c 10 -n 0 foo # Run foo 10 times as fast as possible

# Installation

## [Homebrew](http://brew.sh)

    brew tap justincampbell/formulae
    brew install rr

## Package

    wget -O rr-latest.tar.gz https://github.com/justincampbell/rr/archive/latest.tar.gz rr
    tar -zxvf rr-latest.tar.gz
    cd rr-latest/
    make install
