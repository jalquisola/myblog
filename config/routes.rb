Rails.application.routes.draw do
  root 'pages#profile'

  get "/adwords-expert", controller: "pages", action: "adwords_specialist"
  get "/data-scientist-for-hire", controller: "pages", action: "data_scientist"
end
