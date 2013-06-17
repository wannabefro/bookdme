class ProposalsController < ApplicationController

  def new
    @act = Act.find(params[:act_id])
    @proposal = @act.proposals.build
  end

end
