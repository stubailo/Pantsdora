class PantsController < ApplicationController
  # GET /pants
  # GET /pants.json
  def index

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def random
    @pant = Zappos.get_random_pant(params[:q]?params[:q]:"")

    respond_to do |format|
      format.html # random.html.erb
      format.json { render json: @pant }
    end
  end

end
