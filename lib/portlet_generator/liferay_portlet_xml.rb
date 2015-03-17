require_relative 'node_injector'

module PortletGenerator
  class LiferayPortletXML < NodeInjector
    def input_xml_file
      'src/main/webapp/WEB-INF/liferay-portlet.xml'
    end

    def template_file
      'liferay-portlet-entry.xml.erb'
    end
  end
end
