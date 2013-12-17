#
# Sorts rendered lines.
#
# Author:: Mark Trapp
# Copyright:: Copyright (c) 2013 Mark Trapp
# License:: MIT

module Jekyll
  class Sort < Liquid::Block
    def render(context)
      super.split(/\n/).sort.join("\n")
    end
  end
end

Liquid::Template.register_tag('sort', Jekyll::Sort)
