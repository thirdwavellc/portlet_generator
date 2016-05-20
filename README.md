# PortletGenerator

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'portlet_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install portlet_generator

## Usage

TODO: Write usage instructions here

## Action Outline

The following outlines the general approach to file creation that is accomplished in this generator

### Create New Controller
/src/main/java/com/crescendo/portal/ui/ctrl/{ClassName}.java

### Create a Language File
/src/main/resources/content/{ClassName}/Language.properties

### Create Portlet Context
/src/main/webapp/WEB-INF/{portlet-id}-portlet.xml

### Create Servlet Context
/src/main/webapp/WEB-INF/{portlet-id}-context.xml

### Add XML Portlet Nodes in each of the following three files
/src/main/webapp/WEB-INF/liferay-portlet.xml
/src/main/webapp/WEB-INF/liferay-display.xml
src/main/webapp/WEB-INF/portlet.xml

### Add UI File set for each portlet under 
/src/main/webapp/templates/{ClassName}

## Contributing

1. Fork it ( https://github.com/[my-github-username]/portlet_generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
