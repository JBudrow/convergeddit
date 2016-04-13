class VotesController < ApplicationController
  before_action :authenticate!

  def create
    @vote = logged_in_user.votes.new(link_id: params[:link_id],
                                     score: params[:score])
    flash[:notice] = 'unable to do that action' unless @vote.save
    redirect_to root_path # default GET
  end
end
