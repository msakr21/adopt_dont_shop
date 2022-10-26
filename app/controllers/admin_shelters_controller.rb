class AdminSheltersController < SheltersController
  def index
      @shelters = Shelter.order_alphabetically_in_reverse
      @shelters_with_pending_apps = Shelter.alphabetical_shelters_with_pending_applications
  end
end