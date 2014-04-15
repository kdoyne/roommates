class WelcomeController < ApplicationController

  def index
  end

  def texting
    render(:texting)
  end
  
end