Rails.application.routes.draw do
  resources :projects, only: [:index, :show]
  get '/projects/:project_slug/lines/:line_slug/expenditures' => 'expenditures#index', as: :project_line_expenditures
  root 'projects#index'
end
