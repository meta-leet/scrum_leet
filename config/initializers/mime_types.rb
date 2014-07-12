# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

require 'action_controller/metal/renderers'

Mime::Type.register "application/hal+json", :haljson

ActionController.add_renderer :haljson do |hj, options|
  self.content_type ||= Mime::Haljson
end
