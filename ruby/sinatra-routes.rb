get '/' do
  # executed on a root ("site.com/")
end

get '/login' do
  # executed on "site.com/login"
end

get '/' do
  # renders a ERB template
  erb(:home) # template is found at 'app/views/home.erb'
end

# collect URL params
get '/post/:id/edit' do
  # params[:id] will be captured from URL "site.com/post/<id>/edit"
  # when it's "site.com/post/101/edit" params[:id] will be 101

  # @id will be available in the template
  @id = params[:id]
   erb(:post)
end
