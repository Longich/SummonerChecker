Rails.application.routes.draw do
  root 'home_page#home'
  get 'summoner', to: 'summoner#show'
end