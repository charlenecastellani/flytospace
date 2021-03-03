class ApplicationController < ActionController::Base


def voyages
  @voyages = Voyage.all
end

end
