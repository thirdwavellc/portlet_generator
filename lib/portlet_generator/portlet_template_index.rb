require_relative 'file_renderer'
require 'fileutils'

module PortletGenerator
  class PortletTemplateIndex < FileRenderer
    def generate
      make_template_dir

      super
    end

    def template
      File.read(File.expand_path('templates/index.html.erb', __dir__))
    end

    def target_file
      "#{template_dir}/index.html"
    end

    def template_dir
      "src/main/webapp/templates/#{generator.name}"
    end

    private

    def make_template_dir
      FileUtils.mkdir_p template_dir
    end
  end
end
