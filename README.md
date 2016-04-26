# RegXing
[![Gem Version](https://badge.fury.io/rb/regxing.svg)](https://badge.fury.io/rb/regxing)  [![Build Status](https://travis-ci.org/danascheider/regxing.svg?branch=master)](https://travis-ci.org/danascheider/regxing)  [![Coverage Status](https://coveralls.io/repos/github/danascheider/regexpert/badge.svg?branch=master)](https://coveralls.io/github/danascheider/regexpert?branch=master)  [![Code Climate](https://codeclimate.com/github/danascheider/regexpert/badges/gpa.svg)](https://codeclimate.com/github/danascheider/regexpert)  [![Dependency Status](https://gemnasium.com/badges/github.com/danascheider/regxing.svg)](https://gemnasium.com/github.com/danascheider/regxing)

RegXing is a tool that takes regular expressions as input and returns strings matching them!

## Installation
You can install RegXing using <pre><code>gem install regxing</code></pre>, or alternatively, you can add to your project's Gemfile: <pre><code>gem "regxing", "~> 0.1.0"</code></pre>

## Usage
<pre><code>generator = RegXing::Generator.new(/\d{3}-\d{2}-\d{4}/)
generator.generate!
\# => 891-27-2800</code></pre>
