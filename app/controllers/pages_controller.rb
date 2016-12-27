class PagesController < ApplicationController
  def profile
    @description = "Senior Software Engineer. Data Scientist. Ruby on Rails Developer. Certified Google Adwords Specialist. Certified Google Analytics Expert."
    render :profile, layout: false
  end

  def data_scientist
    @title = "Data Scientist | Joseph Alquisola"
    @description = "Data Scientist. Machine Learning Developer. Certified Google Adwords Specialist. Certified Google Analytics Expert."
    render :data_scientist, layout: false
  end

  def python_machine_learning
    @description = "Are you looking for machine learning book? As a data scientist, see my book review on Python Machine Learning."
    render :python_machine_learning, layout: false
  end
end
