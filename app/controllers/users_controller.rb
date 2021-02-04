# rails g controller Users

class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update, :edit_password, :update_password]
    def new
        @user=User.new
    end

    def create
        @user=User.new user_params
        if @user.save
            session[:user_id]=@user.id # we are storing the user id alone in the session 
            redirect_to root_path, notice: "Signed in Successfully!"
        else
            render :new
        end
    end

    def edit 
        
    end

    def update
        
        if @user.update params.require(:user).permit(:name, :email)
            flash[:notice]="User Info edited and saved."
            redirect_to posts_path
        else
            render :edit
        end
    end

    def edit_password
        
    end

    def update_password
        if @user&.authenticate params[:user][:current_password]
            new_password = params[:user][:new_password]
            new_password_confirmation = params[:user][:new_password_confirmation]
            new_password_different = new_password != params[:user][:current_password]
            password_confirmed = new_password == new_password_confirmation
            if new_password_different && password_confirmed
                if @user.update password: new_password, password_confirmation: new_password_confirmation
                    flash[:notice] = "Password changed successfully."
                    redirect_to root_path
                else 
                    flash[:alert] = "Password update failed."
                    render :edit_password
                end
            else
                flash[:alert] = "New password confirmation does not match."
                render :edit_password
            end
        else
            flash[:alert] = "Your current password does not match our records."
            render :edit_password
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def find_user
        @user = User.find params[:id]
    end
end

