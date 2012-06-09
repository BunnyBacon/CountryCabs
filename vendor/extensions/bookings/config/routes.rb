Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :bookings do
    resources :bookings, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :bookings, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :bookings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
