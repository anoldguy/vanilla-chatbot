require 'rack'
require 'rack/contrib'
require './cognition-demo'

use Rack::PostBodyContentTypeParser

run CognitionDemo
