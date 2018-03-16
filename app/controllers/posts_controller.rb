class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit #form to edit
		@post = Post.find(params[:id])
	end

	def update #update instance
		# raise params.inspect
		# puts params.inspect
		@post=Post.find(params[:id])
		@post.update(title: params[:title],description: params[:description])
		redirect_to post_path(@post)
	end

end

#
# Query the database for the Post record that matches the :id passed to the route.
#
# Store the query in an instance variable.
#
# Update the values passed from the form (the update method here is the update method supplied by Active Record, not the update method we're creating). The update method takes a hash of the attributes for the model as its argument, e.g. `Post.find(1).update(title: "I'm Changed", description: "And here too!")
#
# Save the changes in the database.
#
# Redirect the user to the show page so they can see the updated record.
