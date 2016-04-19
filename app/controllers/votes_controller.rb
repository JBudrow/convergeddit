class VotesController < ApplicationController
  before_action :authenticate!

  def create
    @vote = logged_in_user.votes.new(url_id: params[:url_id],
                                     score: params[:score])
    flash[:notice] = 'unable to do that action' unless @vote.save
    redirect_to root_path
  end
end
