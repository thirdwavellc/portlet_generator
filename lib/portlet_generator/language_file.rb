require_relative 'file_renderer'
require 'fileutils'

module PortletGenerator
  class LanguageFile < FileRenderer
    def generate
      make_portlet_dir

      super
    end

    def template
      File.read(File.expand_path('templates/Language.properties.erb', __dir__))
    end

    def target_file
      "#{portlet_dir}/Language.properties"
    end

    def portlet_dir
      "src/main/resources/content/#{generator.portlet.name}"
    end

    private

    def make_portlet_dir
      FileUtils.mkdir_p portlet_dir
    end
  end
end
