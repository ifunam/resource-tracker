Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { sessions: 'api/v1/sessions' }

      resources :projects, only: [:index, :show]
      get '/projects/:project_slug/lines' => 'lines#index', as: :project_lines
      get '/projects/:project_slug/lines/:line_slug/expenditures' => 'expenditures#index', as: :project_line_expenditures

      resources :data_migrations, only: [:create]
    end
  end
end
