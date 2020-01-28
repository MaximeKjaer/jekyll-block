# frozen_string_literal: true

require "jekyll"

module Jekyll
  module Block
    # A Jekyll Liquid {% block %} block tag that generates HTML for block-styled content.
    # The content of the block can contain Markdown, which will be parsed by kramdown.
    #
    # Usage:
    #   {% block <type> ["Title"] %}
    #   *Markdown content*
    #   {% endblock %}
    #
    # The type argument is mandatory, and the title is optional.
    class BlockTag < Liquid::Block
      def initialize(tag_name, text, tokens)
        @type, @title = text.match(%r!\s*(\w+)\s+(?:\"(.*)\".*)?!im).captures
        @id = @title ? @type.downcase + ":" + Jekyll::Utils.slugify(@title) : nil
        super
      end

      attr_reader :type, :title, :id

      def render(context)
        text = super
        if @title
          "<div class=\"block #{@type}\" id=\"#{@id}\" markdown=\"block\">"\
            "<a class=\"header\" href=\"##{id}\">"\
              "#{@type.capitalize}: #{@title}"\
            "</a>"\
            "\n#{text}\n"\
          "</div>"
        else
          "<div class=\"block #{@type}\" markdown=\"block\">"\
            "<span class=\"header\">#{@type.capitalize}</span>"\
            "\n#{text}\n"\
          "</div>"
        end
      end
    end
  end
end

Liquid::Template.register_tag("block", Jekyll::Block::BlockTag)
