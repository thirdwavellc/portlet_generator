require 'pry'
require 'nokogiri'

module PortletGenerator
  class NodeInjector
    attr_reader :name, :generator

    def initialize(generator)
      @name = generator.name
      @generator = generator
    end

    def generate
      xml = load_input_xml
      entry_xml = load_liferay_portlet_entry_xml

      edited_xml = insert_portlet_entry(entry_xml, xml)
      save_input_xml(edited_xml)
    end

    def input_xml_file
      fail 'NodeInjector: you must specify an input_xml_file'
    end

    def input_xml
      File.read(input_xml_file)
    end

    def template_file
      fail 'NodeInjector: you must specify a template file'
    end

    def template
      File.read(File.expand_path("templates/#{template_file}", __dir__))
    end

    def insertion_xpath(xml)
      xml.xpath('//portlet').last
    end

    private

    def load_input_xml
      Nokogiri::XML(input_xml)
    end

    def load_liferay_portlet_entry_xml
      renderer = ERB.new(template)

      rendered_file = renderer.result(generator.get_binding)
      Nokogiri::XML(rendered_file)
    end

    def insert_portlet_entry(entry, xml)
      entry_node = entry.xpath('//portlet')
      last_portlet = insertion_xpath(xml)
      last_portlet.add_next_sibling(entry_node)
      xml
    end

    def save_input_xml(edited_xml)
      xml = fix_stupid_xml_formatting(edited_xml)
      File.open("#{input_xml_file}", 'w') { |f| f.write xml }
    end

    def fix_stupid_xml_formatting(edited_xml)
      edited_xml.to_xml.gsub("</portlet><portlet>", "</portlet>\n  <portlet>")
    end
  end
end
