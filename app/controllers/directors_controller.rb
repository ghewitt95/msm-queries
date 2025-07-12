class DirectorsController < ApplicationController
  def index
    render({ :template => "director_template/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)
     
    render({ :template => "director_template/details" })
  end

  def youngest
    @youngest = Director.where.not(dob: nil).order(dob: :desc).first

    render({ :template => "director_template/youngest" })
  end

  def eldest
    @eldest = Director.where.not(dob: nil).order(dob: :asc).first

    render({ :template => "director_template/eldest" })
  end
end
