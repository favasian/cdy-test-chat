class AccountsController < ApplicationController

  def index
    @accounts = Account.order(name: :asc)
  end

  def show
    @account = Account.find(params[:id])
  end


  def delete_job_posts
    JobPost.all.each do |jp|
      jp.chats.each do |chat|
        chat.destroy
      end
      jp.destroy
    end
    redirect_to root_path
  end
      

  def delete_non_clinical_job_posts
    NonClinicalJobPost.all.each do |jp|
      jp.chats.each do |chat|
        chat.destroy
      end
      jp.destroy
    end
    redirect_to root_path
  end
  
  def delete_all_chats
    Chat.all.each do |chat|
      chat.destroy
    end
    redirect_to root_path
  end

end