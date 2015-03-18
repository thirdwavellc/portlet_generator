require_relative 'file_renderer'

module PortletGenerator
  class PortletJsMain < FileRenderer
    def generate
      make_js_dir

      super
    end

    def template
      File.read(File.expand_path('templates/main.js.erb', __dir__))
    end

    def target_file
      "#{js_dir}/main.js"
    end

    def js_dir
      "src/main/webapp/templates/#{generator.name}/js"
    end

    private

    def make_js_dir
      FileUtils.mkdir_p js_dir
    end
  end
end
