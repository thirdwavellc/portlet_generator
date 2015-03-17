require 'erb'
require 'fileutils'

module PortletGenerator
  class LanguageFile
    attr_reader :name, :generator

    def initialize(generator)
      @name = generator.name
      @generator = generator
    end

    def generate
      make_portlet_dir
      renderer = ERB.new(template)
      File.open(language_file, 'w') { |f| f.write renderer.result(generator.get_binding) }
    end

    def template
      File.read(File.expand_path('templates/Language.properties.erb', __dir__))
    end

    def portlet_dir
      "src/main/resources/content/#{generator.portlet.name}"
    end

    def language_file
      "#{portlet_dir}/Language.properties"
    end

    private

    def make_portlet_dir
      FileUtils.mkdir_p portlet_dir
    end
  end
end
