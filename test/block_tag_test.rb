# frozen_string_literal: true

require "test_helper"
require "liquid"

class Jekyll::Block::BlockTagTest < Minitest::Test
  def self.parse_block(args, content = "")
    Liquid::Template.parse("{% block #{args} %}#{content}{% endblock %}").root.nodelist[0]
  end

  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Block::VERSION
  end

  def test_it_parses_type_with_title
    block = self.class.parse_block('note "this is a test"')
    assert_equal("note", block.type)
  end

  def test_it_parses_type_without_title
    block = self.class.parse_block(" note ")
    assert_equal("note", block.type)
  end

  def test_it_parses_title
    block = self.class.parse_block('note "This is the title"')
    assert_equal("This is the title", block.title)
  end

  def test_it_parses_title_with_spacing
    block = self.class.parse_block('note     "This is the title" ')
    assert_equal("This is the title", block.title)
  end

  def test_it_has_no_id_without_title
    block = self.class.parse_block("warning")
    assert_nil(block.id)
  end

  def test_it_has_id_with_title
    block = self.class.parse_block('warning "Title"')
    assert_equal("warning:title", block.id)
  end
end
