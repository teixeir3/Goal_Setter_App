GoalSetterApp::Application.routes.draw do

  root to: 'sessions#new'

  put 'goals/:id/complete' => 'goals#complete', as: "goal_completion"

  resources :users, :only => [:index, :new, :create, :show, :destroy] do
    resources :goals, :only => [:create]
  end
  resource :session, :only => [:new, :create, :destroy]
  resources :goals, :only => [:edit, :update, :destroy]
end
