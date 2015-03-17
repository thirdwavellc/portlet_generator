require_relative 'node_injector'

module PortletGenerator
  class PortletXML < NodeInjector
    def input_xml_file
      'src/main/webapp/WEB-INF/portlet.xml'
    end

    def template_file
      'portlet-entry.xml.erb'
    end

    def insertion_xpath(xml)
      xml.xpath('//liferay:portlet',
                'liferay' => 'http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd')
         .last
    end
  end
end
