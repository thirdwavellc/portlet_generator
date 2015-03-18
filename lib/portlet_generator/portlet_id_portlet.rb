require_relative 'file_renderer'

module PortletGenerator
  class PortletIdPortlet < FileRenderer
    def template
      File.read(File.expand_path('templates/portlet-id-portlet.xml.erb', __dir__))
    end

    def target_file
      "src/main/webapp/WEB-INF/#{generator.portlet.id}-portlet.xml"
    end
  end
end
