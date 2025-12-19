class Event < ApplicationRecord
  has_one_attached  :cover      # 목록에 보이는 대표 이미지 1장
  has_many_attached :photos     # “활동사진” 갤러리 여러 장
end