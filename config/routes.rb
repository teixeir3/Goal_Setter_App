GoalSetterApp::Application.routes.draw do

  root to: 'sessions#new'

  put 'goals/:id/complete' => 'goals#complete'

  resources :users, :only => [:new, :create, :show] do
    resources :goals, :only [:create]
  end
  resource :session, :only => [:new, :create, :destroy]
  resources :goals, :only => [:edit, :update, :destroy]
end
