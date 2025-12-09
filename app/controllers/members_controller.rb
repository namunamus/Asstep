class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = Member.all          # 멤버 전체 목록
    @events  = Post.all            # 이 줄이 필요 없으면 지워도 됨
  end

  def new
    @member = Member.new
  end

  def show
    @member = Member.find(params[:id])
  end

  def create
    member = Member.new(member_params)
    if member.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    if member.update(member_params)
      redirect_to action: "show", id: member.id
    else
      redirect_to action: "new"
    end
  end

  def destroy
    member = Member.find(params[:id])
    member.destroy
    redirect_to action: :index
  end

  # 멤버 검색 기능을 나중에 붙이고 싶으면 여기서 Member.ransack 써서 만들면 됨
  # def search
  #   @q = Member.ransack(params[:q])
  #   @members = @q.result
  # end

  def about
  end

  private

  def member_params
    # 멤버가 갖는 항목에 맞게 permit 안을 수정해
    params.require(:member).permit(:name, :role, :intro, :image_url)
  end
end