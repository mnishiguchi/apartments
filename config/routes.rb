Rails.application.routes.draw do
  # transit/dc/washington/mcpherson-square/over-500-pet-friendly-dog/dishwasher-parking/
  get "transit/:state/:location/:name/*filter",
      to: "apartments#transit",
      constraints: { state: /\w{2}/ }, as: :transit_apartments
  # military/va/arlington/the-pentagon/over-500-pet-friendly-dog/dishwasher-parking/
  get "military/:state/:location/:name/*filter",
      to: "apartments#military",
      constraints: { state: /\w{2}/ }, as: :military_apartments
  # off-campus-housing/dc/washington/university-of-the-district-of-columbia/over-500-pet-friendly/
  get "off-campus-housing/:state/:location/:name/*filter",
      to: "apartments#off_campus_housing",
      constraints: { state: /\w{2}/ }, as: :off_campus_housing_apartments
  # dc/20009/over-500-pet-friendly-dog/dishwasher-parking/
  get ":state/:postal_code/*filter",
      to: "apartments#postal_code",
      constraints: { state: /\w{2}/, postal_code: /\d{5}/ }, as: :postal_code_apartments
  # va/reston/over-500-pet-friendly-dog/dishwasher-parking/
  get ":state/:location/*filter",
      to: "apartments#index",
      constraints: { state: /\w{2}/ }, as: :apartments

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
  # Check if how rails recognizes paths:
  #   Rails.application.routes.recognize_path "/some-path"
end
