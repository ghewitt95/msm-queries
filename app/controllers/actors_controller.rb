class ActorsController < ApplicationController
  def index
    render({ :template => "actor_template/list" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Actor.where({ :id => the_id })

    @the_actor = matching_records.at(0)
     
    render({ :template => "actor_template/details" })
  end
end
