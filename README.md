# Regexpert
[![Build Status](https://travis-ci.org/danascheider/regexpert.svg?branch=master)](https://travis-ci.org/danascheider/regexpert)  [![Coverage Status](https://coveralls.io/repos/github/danascheider/regexpert/badge.svg?branch=master)](https://coveralls.io/github/danascheider/regexpert?branch=master)  [![Code Climate](https://codeclimate.com/github/danascheider/regexpert/badges/gpa.svg)](https://codeclimate.com/github/danascheider/regexpert)

Regexpert is a tool that takes regular expressions as input and returns strings matching them!

## Installation
You can install Regexpert using <pre><code>gem install regexpert</code></pre>, or alternatively, you can add to your project's Gemfile: <pre><code>gem "regexpert", "~> 0.0.1"</code></pre>

## Usage
<pre><code>generator = Regexpert::Generator.new(/\d{3}-\d{2}-\d{4}/)
# => 891-27-2800
