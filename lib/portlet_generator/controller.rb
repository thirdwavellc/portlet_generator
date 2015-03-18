require_relative 'file_renderer'

module PortletGenerator
  class Controller < FileRenderer
    def template
      File.read(File.expand_path('templates/controller.java.erb', __dir__))
    end

    def target_file
      "src/main/java/com/crescendo/portal/ui/ctrl/#{generator.name}.java"
    end
  end
end
