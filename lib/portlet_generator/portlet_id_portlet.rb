require 'erb'

module PortletGenerator
  class PortletIdPortlet
    attr_reader :name, :generator
    def initialize(generator)
      @name = generator.name
      @generator = generator
    end

    def generate
      renderer = ERB.new(template)
      File.open(portlet_file, 'w') { |f| f.write renderer.result(generator.get_binding) }
    end

    def template
      File.read(File.expand_path('templates/portlet-id-portlet.xml.erb', __dir__))
    end

    def portlet_file
      "src/main/webapp/WEB-INF/#{generator.portlet.id}-portlet.xml"
    end
  end
end
