class UsersController < ApplicationController
layout 'register'
  # before_action :login_required, :only => :my_account
   def new     
      @user = User.new    
     #  @feedback = Feedback.new 
     # @userdetails = Userdetail.new
  end 
    
    def create    
     @user = User.new(user_params) 
      if @user.save         
      #UserNotifier.send_signup_email(@user).deliver_now
       session[:user_id] = @user.id  
       
       respond_to do |format|  
        
         format.html { redirect_to root_url, notice: 'Thank you for SignUp. Create Your blog post here.' }
       end

      else  
       #render :text => @user.password_salt     
        respond_to do |format|  
        
        format.js   
        @user.errors.any?
        @user.errors.each do |key, value|
end
           end 
      end  
    end     
  def login  
  
  end  
  def edit 
    @user = current_user
    respond_to do |format|
   format.js   { render 'edit.js.erb' }
  end
  end
      def update
    @user = User.find(current_user.id)
   
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      flash[:notice] = "Profile edited successfully"
      redirect_to root_path
    else
     respond_to do |format|  
       
        format.js   {render 'update.js.erb'}
       @errors = @user.errors.full_messages
     
       
           end 
    end
  end
  def process_login  
  
	if params[:register]
       user = User.authenticate(params[:email], params[:password]) 
  
   if user  
   
      session[:user_id] = user.id  
      flash[:success] = "You are logged in."
     #render :text => "calling this"
    #  redirect_to :my_account, :notice => "Logged in!"  
     redirect_to root_url
    
   else  
   
      flash[:success] = "You are logged in."  
      #render :text => "calling this"
    redirect_to root_url  
     
    end  
      
      
      
   elsif params[:login]   
       user = User.authenticate(params[:email].downcase, params[:password]) 
  
   if user  
   
      session[:user_id] = user.id  
      flash[:success] = "You are logged in."
    
     # redirect_to :my_account, :notice => "Logged in!"  
       redirect_to root_url
    
   else  
   respond_to do |format|  
        @errordata = "Invalid Username and Password"
          
        format.js   { render 'error.js.erb' }
           end 
     
    end  
   end
  end   
  
  
  
  
  
  def logout
  session[:user_id] = nil   
    flash[:success] = "Logged out!"   
  redirect_to root_path 
end 

   private
  def user_params  
    params.require(:user).permit(:email, :password , :password_confirmation,:first_name,:last_name,:phone_no)
  end
  
end

