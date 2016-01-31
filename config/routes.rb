Rails.application.routes.draw do
  root 'pages#profile'
  mount Monologue::Engine, at: '/blog'
end
