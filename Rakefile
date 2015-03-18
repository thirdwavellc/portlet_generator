require 'bundler/gem_tasks'
require 'portlet_generator'

task :default => [:build, :install]

task :clean do
  `rm portlet_generator-#{PortletGenerator::VERSION}.gem`
end

task :build => :clean do
  `gem build portlet_generator.gemspec`
end

task :install do
  `gem install portlet_generator-#{PortletGenerator::VERSION}.gem`
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'portlet_generator'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/portlet_generator\// }
    files.each { |file| load file }
    puts 'Reloaded portlet_generator!'
  end

  ARGV.clear
  IRB.start
end
