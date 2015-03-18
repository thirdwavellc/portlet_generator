require_relative 'file_renderer'

module PortletGenerator
  class PortletIdContext < FileRenderer
    def template
      File.read(File.expand_path('templates/portlet-id-context.xml.erb', __dir__))
    end

    def target_file
      "src/main/webapp/WEB-INF/#{generator.portlet.id}-context.xml"
    end
  end
end
