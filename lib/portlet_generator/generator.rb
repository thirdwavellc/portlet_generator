require 'fileutils'
require_relative 'portlet'
require_relative 'controller'
require_relative 'language_file'
require_relative 'portlet_id_context'
require_relative 'portlet_id_portlet'
require_relative 'liferay_portlet_xml'
require_relative 'portlet_xml'


module PortletGenerator
  class Generator
    attr_reader :name, :portlet, :output_dir, :controller, :language_file, :portlet_id_context,
      :portlet_id_portlet, :liferay_portlet_xml, :portlet_xml

    def initialize(portlet, output_dir = 'output')
      @name = portlet.name
      @portlet = portlet
      @output_dir = output_dir
      @controller = Controller.new(self)
      @language_file = LanguageFile.new(self)
      @portlet_id_context = PortletIdContext.new(self)
      @portlet_id_portlet = PortletIdPortlet.new(self)
      @liferay_portlet_xml = LiferayPortletXML.new(self)
      @portlet_xml = PortletXML.new(self)
    end

    def generate
      make_output_dir
      controller.generate
      language_file.generate
      portlet_id_context.generate
      portlet_id_portlet.generate
      liferay_portlet_xml.generate
      portlet_xml.generate
    end

    def get_binding
      binding
    end

    private

    def make_output_dir
      FileUtils.mkdir_p(output_dir)
    end
  end
end
