module Authors
    class AccountsController < AuthorController
        def edit
        end
    
        def update_info
            #TODO: error handling
            if current_author.update(author_info_params)
                flash[:success] = "Successfully Saved Info!"    
            else
                flash[:danger] = current_author.display_error_messages
            end
            redirect_to authors_account_path
        end
        
        def change_password
            author = current_author
            if author.valid_password?(author_password_params[:current_password])
            
                if author.change_password(author_password_params)
                    # devise automatically signs out when changing password
                    sign_in(author, bypass: true)
                    flash[:success] = 'Successfully Changed Password!'
                else
                    flash[:danger] = author.errors.full_messages.join('.  ') << '.'
            
                end
            
            else

                flash[:danger] = 'Current Password Incorrect' 
                
            end
            redirect_to authors_account_path
        
            #breakpoint
            #binding.pry
        end

        private
        def author_info_params
            params.require(:author).permit(:name, :email, :bio)
        end

        def author_password_params
            params.require(:author).permit(:current_password, :new_password, :new_password_confirmation)
        end
    
    end
end