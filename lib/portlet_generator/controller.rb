require 'erb'

module PortletGenerator
  class Controller
    attr_reader :name, :generator

    def initialize(generator)
      @name = generator.name
      @generator = generator
    end

    def generate
      renderer = ERB.new(template)
      File.open(controller_file, 'w') { |f| f.write renderer.result(generator.get_binding) }
    end

    def template
      File.read(File.expand_path('templates/controller.java.erb', __dir__))
    end

    def controller_file
      "src/main/java/com/crescendo/portal/ui/ctrl/#{generator.name}.java"
    end
  end
end
