class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
end

#homeログインしている場合は、新しいMicropostクラスのインスタンスをuser_idを紐付けた状態で初期化
