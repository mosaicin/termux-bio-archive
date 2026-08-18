Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "biographies#index"
  get "/biographies/:slug", to: "biographies#show", as: :biography
  post "/biographies/:id/responses", to: "biographies#create_response", as: :biography_responses
  post "/biographies/:id/questions", to: "biographies#create_question", as: :biography_questions
end

