class AuthorController < ApplicationController
    # anything in the authors namespace requires authentication before any action
    before_action :authenticate_author!
end
