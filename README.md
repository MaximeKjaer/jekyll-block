# jekyll-block

[![Build Status](https://travis-ci.com/MaximeKjaer/jekyll-block.svg?branch=master)](https://travis-ci.com/MaximeKjaer/jekyll-block)
[![Gem Version](https://badge.fury.io/rb/jekyll-block.svg)](https://badge.fury.io/rb/jekyll-block)

`jekyll-block` is a [Jekyll](https://github.com/jekyll/jekyll) plugin that adds a `{% block %}` Liquid block tag for use in Markdown posts parsed by [kramdown](https://github.com/gettalong/kramdown).

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

### Writing block tags

In a Markdown post, you can use the `block` tag as follows:

```liquid
{% block warning %}
This is the text of the warning block! Write *Markdown* here!
{% endblock %}

{% block note "Optional block title" %}
This block will have a title
{% endblock %}
```

The block tag takes two arguments.

1. A single word for the block type. The type is added to the generated HTML's class list. In the above examples, the block types are `warning` and `note`, respectively.
2. A string in quotes for the block title. The title is added to the block's header, and is used to generate an HTML `id` attribute. In the above examples, only the note block has a title, which is `Optional block title`.

### Generated HTML

The following HTML will be generated from the `warning` block above:

```html
<div class="block warning">
  <span class="header">Warning</span>
  This is the text of the warning block! Write <em>Markdown</em> here!
</div>
```

The `note` block has a title, which will be added to the block header and used to generate a value for the `id` attribute.

```html
<div class="block note" id="note:optional-block-title">
  <span class="header">Note: Optional block title</span>
  This block will have a title
</div>
```

### Styling blocks

By default, a block generates a `div`. You can style it into a content block with a few lines of CSS. For example:

```css
.block {
  margin: 1em 0;
  background-color: #85c1e9;
}

.block .header {
  display: block;
}
```

You can also add custom styles to specific kinds of blocks. For instance, to make the warning blocks red:

```css
.block.warning {
  background-color: #ca6f1e;
}
```

## How does it work?

Jekyll uses kramdown as its default parser. Kramdown defines some additional syntax to standard Markdown; among these extensions are [HTML blocks](https://kramdown.gettalong.org/syntax.html#html-blocks). It is able to parse the body of an HTML element as Markdown if the element has a [`markdown="block"` attribute](https://kramdown.gettalong.org/syntax.html#html-blocks) (this feature is available since kramdown v0.2.0; Jekyll 4.0.0 defaults to kramdown 2.1.0).

For the warning example, the plugin generates the following markup:

```html
<div class="block warning" markdown="block">
  <span class="header">Warning</span>
  This is the text of the warning block! Write *Markdown* here!
</div>
```

The above is valid kramdown syntax; kramdown will strip the `markdown` attribute, and parse the content as Markdown, in order to generate the following output:

```html
<div class="block warning">
  <span class="header">Warning</span>
  This is the text of the warning block! Write <em>Markdown</em> here!
</div>
```

This approach is different to that taken by most alternative plugins, which typically call a new instance of the Markdown parser for the block's content, instead of relying on syntactic features. That approach breaks some advanced kramdown features, such as [link definitions](https://kramdown.gettalong.org/syntax.html#link-definitions), [footnotes](https://kramdown.gettalong.org/syntax.html#footnotes) and [abbreviations](https://kramdown.gettalong.org/syntax.html#abbreviations), as blocks aren't parsed by the same instance as the rest of the document. Instead, `jekyll-block`'s approach ensures that these also work inside `{% block %}` tags.

## Alternatives

- [Premonition](https://github.com/lazee/premonition)

  `jekyll-block` is very similar to Premonition, although with a few differences:

  - Premonition supports both [kramdown](https://github.com/gettalong/kramdown) and [Redcarpet](https://github.com/vmg/redcarpet)
  - Premonition introduces new Markdown syntax instead of using a Liquid tag
  - `jekyll-block` works in [post excerpts](https://jekyllrb.com/docs/posts/#post-excerpts)
  - `jekyll-block` works with [link definitions](https://kramdown.gettalong.org/syntax.html#link-definitions), [footnotes](https://kramdown.gettalong.org/syntax.html#footnotes) and [abbreviations](https://kramdown.gettalong.org/syntax.html#abbreviations)
  - Premonition supports Markdown content when used in HTML source files, which `jekyll-block` does not

- [Jolt](https://github.com/helpscout/jekyll-jolt)

  Jolt makes it possible to write Liquid templates that can be called from a Liquid tag. You can construct `jekyll-block`'s functionality using Jolt. However, as Jolt is a more general-purpose tool, it takes more configuration and has a more verbose syntax.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests. Run `rubocop` to run formatting and linting checks.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb` and commit it locally. Then, run `git tag "v1.2.3"` (for instance, to release version 1.2.3), and `git push --tags && git push`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MaximeKjaer/jekyll-block.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
