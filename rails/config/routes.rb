Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index, :show]
      get '/projects/:project_slug/lines/:line_slug/expenditures' => 'expenditures#index', as: :project_line_expenditures
    end
  end
end
