require 'erb'

module PortletGenerator
  class FileRenderer
    attr_reader :name, :generator

    def initialize(generator)
      @name = generator.name
      @generator = generator
    end

    def generate
      renderer = ERB.new(template)
      File.open(target_file, 'w') { |f| f.write renderer.result(generator.get_binding) }
    end

    def template
      fail 'FileRenderer: you must specify a template'
    end

    def target_file
      fail 'FileRenderer: you must specify a target_file'
    end
  end
end
