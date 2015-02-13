Rails.application.routes.draw do
  #get 'expenditures/index'

  resources :projects, only: [:index, :show]
  get '/projects/:project_slug/lines/:line_slug/expenditures' => 'expenditures#index', as: :project_line_expenditures
  root 'projects#index'
end
