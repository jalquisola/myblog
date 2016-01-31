class PagesController < ApplicationController
  def profile
    render :profile, layout: false
  end
end
