class PagesController < ApplicationController
  def home
    @title = "Home" 
  end

  def contact
      @title = "Contact"
      from_email = params[:email]
      if from_email =~ /^[a-zA-Z0-9._%-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}$/
        # do something
        #subscribe the user
        h = Hominid::Base.new(:api_key => MAILCHIMP_API_KEY)
        h.subscribe("89a08cf4a4", from_email, {:FNAME => 'Steve', :LNAME => 'Harvey'})
        flash[:notice] = 'Thanks for your interest. We will let you know when we launch'
        redirect_to(:action => 'home')

      else
        #do something else
        flash[:warning] = 'Your email appears to be invalid.'
        redirect_to(:action => 'home')
      end
  end
  
  def about
    @title = "About"
  end

end
