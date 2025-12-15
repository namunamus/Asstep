class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    member = Member.new(member_params)
  end

  def edit
      @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
  end
end
