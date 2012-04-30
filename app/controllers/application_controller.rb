class ApplicationController < ActionController::Base
  protect_from_forgery

	def comment 
	  # Extracts the name of the class
	  klass = self.class.to_s[/\A(\w+)sController\Z/,1] 
	  # Evaluates the class and gets the current object of that class
	  @comentable_class = eval "#{klass}.find(params[:id])"
	  # Creates a comment using the data of the form
	  comment = Comment.new(params[:comment])
	  # Adds the comment to that instance of the class
	  @comentable_class.add_comment(comment)

	  flash[:notice] = "Your comment has been added!"
	  redirect_to :action => "show", :id => params[:id] 
	end    

  def after_sign_out_path_for(users)
    beta_path
  end	

end
