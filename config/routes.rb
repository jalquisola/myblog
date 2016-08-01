Rails.application.routes.draw do
  root 'pages#profile'

  get "/python-machine-learning", controller: "pages", action: "python_machine_learning"
  #mount Monologue::Engine, at: '/blog'
end
