class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
  end
end

#homeログインしている場合は、新しいMicropostクラスのインスタンスをuser_idを紐付けた状態で初期化
