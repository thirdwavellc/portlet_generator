require_relative 'file_renderer'

module PortletGenerator
  class PortletCssMain < FileRenderer
    def generate
      make_css_dir

      super
    end

    def template
      File.read(File.expand_path('templates/main.css.erb', __dir__))
    end

    def target_file
      "#{css_dir}/main.css"
    end

    def css_dir
      "src/main/webapp/templates/#{generator.name}/css"
    end

    private

    def make_css_dir
      FileUtils.mkdir_p css_dir
    end
  end
end
