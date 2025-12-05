Rails.application.routes.draw do
  root "static_pages#top"

  resources :reservations, only: %i[new create show destroy] do
    collection do
      get  :search    # 予約確認の入力画面
      post :lookup    # 電話番号で検索
    end
  end
end