Rails.application.routes.draw do
  namespace :admin do
    resources :amenities
    resources :apartments
    resources :apartment_amenities
    resources :apartment_locations
    resources :floorplans
    resources :floorplan_amenities
    resources :locations
    resources :managements
    resources :management_locations

    root to: "apartments#index"
  end

  get "about" => "pages#about"
  root "pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
