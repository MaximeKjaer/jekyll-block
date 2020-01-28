# jekyll-block

[![Build Status](https://travis-ci.com/MaximeKjaer/jekyll-block.svg?branch=master)](https://travis-ci.com/MaximeKjaer/jekyll-block)

`jekyll-block` is a Jekyll plugin that adds a `{% block %}` Liquid block.

It is very similar to [Premonition](https://github.com/lazee/premonition), but has a few differences:

- Only supports Kramdown; does not support RedCarpet
- Works in [post excerpts](https://jekyllrb.com/docs/posts/#post-excerpts)
- Works with Kramdown [link definitions](https://kramdown.gettalong.org/syntax.html#link-definitions), [footnotes](https://kramdown.gettalong.org/syntax.html#footnotes) and [abbreviations](https://kramdown.gettalong.org/syntax.html#abbreviations)

It's also similar to [Jolt](https://github.com/helpscout/jekyll-jolt), but has a more concise syntax.

## Installation

Add the following to your `Gemfile`:

```ruby
group :jekyll_plugins do
  gem "jekyll-block", "~> 0.0.1"
end
```

Then add jekyll-block to `plugins` in Jekyll's `_config.yml`:

```yml
plugins:
  - jekyll-block
```

Then run:

```console
$ bundle install
```

## Usage

In a Markdown post, you can use the `block` tag as follows:

```liquid
{% block warning %}
This is the text of the warning block! Note that you **can** write Markdown here.
{% endblock %}

{% block note "Optional block title" %}
This block will also have a title
{% endblock %}
```

The block tag takes two arguments:

- **type**: A single word for the block type. The type is added to the generated HTML's class list.
- **title**: A string in quotes for the block title. The title is added to the block's header, and is used to generate an HTML `id` attribute.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests. Run `rubocop` to run formatting and linting checks.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb` and commit it locally. Then, run `git tag "v1.2.3"`, and `git push --tags`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MaximeKjaer/jekyll-block.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
