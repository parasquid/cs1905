ParasquidCs1905::Application.routes.draw do
  resource :preferences, only: [:show, :create, :update]
end
