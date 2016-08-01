class PagesController < ApplicationController
  def profile
    render :profile, layout: false
  end

  def python_machine_learning
    @description = "Are you looking for machine learning book? As a data scientist, see my book review on Python Machine Learning."
    render :python_machine_learning, layout: false
  end
end
