require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"

require_relative "./config/application.rb"
require_relative "./docraptor.rb"

set :root, File.expand_path("..", __dir__)
set :views, proc { File.join(root, "app/views") }
set :bind, '0.0.0.0'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  'Hello world!'
end

post '/create' do
  begin
    # Parse request parameters
    user_input = JSON.parse(request.body.read)

    # Generate the resume PDF
    pdf_response = ResumeGenerator.generate_resume(user_input)

    # Send the PDF response
    content_type 'application/pdf'
    pdf_response
  rescue JSON::ParserError => e
    status 400
    body "Invalid JSON format: #{e}"
  rescue StandardError => e
    status 500
    body "Error generating PDF: #{e}"
  end
end
