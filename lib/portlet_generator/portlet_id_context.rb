require 'erb'

module PortletGenerator
  class PortletIdContext
    attr_reader :name, :generator
    def initialize(generator)
      @name = generator.name
      @generator = generator
    end

    def generate
      renderer = ERB.new(template)
      File.open(context_file, 'w') { |f| f.write renderer.result(generator.get_binding) }
    end

    def template
      File.read(File.expand_path('templates/portlet-id-context.xml.erb', __dir__))
    end

    def context_file
      "src/main/webapp/WEB-INF/#{generator.portlet.id}-context.xml"
    end
  end
end
