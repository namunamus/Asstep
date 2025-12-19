# app/controllers/members_controller.rb
class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.order(created_at: :desc)
  end

  def new
    @member = Member.new
  end

  # ✅ 중복 생성 방지(같은 namae면 update처럼 덮어쓰기)
  def create
    @member = Member.find_or_initialize_by(namae: member_params[:namae])
    @member.assign_attributes(member_params)

    if @member.save
      redirect_to members_path, notice: "保存しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to members_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ✅ 한 건만 삭제 + index로 복귀
  def destroy
    @member.destroy
    redirect_to members_path, notice: "削除しました"
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

def member_params
  params.require(:member).permit(:namae, :daigakumei, :zikointro, :photo)
end
end
