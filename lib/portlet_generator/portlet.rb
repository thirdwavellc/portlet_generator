module PortletGenerator
  class Portlet
    attr_reader :name, :title, :id

    def initialize(args = {})
      @name = args[:name]
      @title = args[:title]
      @id = args[:id]
    end
  end
end
