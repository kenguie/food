class UserMailer < ActionMailer::Base

  def welcome_email(current_user)
  	@current_user = current_user
    mail :subject => "Welcome to Tweat on Food!",
         :to      => @current_user.email,
         :from    => "no-reply@tweatonfood.com"
  end

   def goodbye_email(current_user)
  	@current_user = current_user
    mail :subject => "Good-bye from Tweat on Food!",
         :to      => @current_user.email,
         :from    => "no-reply@tweatonfood.com"
  end

  def followed_email(current_user, post)
  	@current_user = current_user
  	@post = post
    mail :subject => "You're being followed!",
         :to      => @post.email,
         :from    => "no-reply@tweatonfood.com"
  end

  def unfollowed_email(current_user, post)
  	@current_user = current_user
  	@post = post
    mail :subject => "Someone has stopped following you.",
         :to      => @post.email,
         :from    => "no-reply@tweatonfood.com"
  end

  def commented_email(current_user, post)
   	@current_user = current_user
  	@post = post
    mail :subject => "Someone has commented on your post.",
         :to      => @post.user.email,
         :from    => "no-reply@tweatonfood.com"
  end

end


