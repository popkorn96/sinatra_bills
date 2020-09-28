require 'pry'
class BillsController < ApplicationController

  get "/bills" do
    if is_logged_in?
      @bills = current_user.bills
      @user = current_user
      erb :"/bills/index.html"
    else
      redirect "/login"
    end
  end

  get "/bills/new" do
    if !is_logged_in?
      redirect "/login"
    else 
      @user = current_user
      erb :"/bills/new.html"
    end
  end

  post "/bills" do
    @bill = Bill.new(params)
    @bill.user = current_user
    if is_logged_in? && @bill.save
        redirect "/bills/#{@bill.id}"
    elsif !@bill.save
      redirect "/bills/new"
    else
      redirect "/login"
    end
  end

  get "/bills/:id" do
    @user = current_user
    @bill = Bill.find(params[:id])
    redirect_if_not_authorized
    if is_logged_in?
      erb :"/bills/show_bill.html"
    else
      redirect "/login"
    end
  end

  get "/bills/:id/edit" do
    @user = current_user
    @bill = Bill.find(params[:id])
    redirect_if_not_authorized
    if !is_logged_in?
      redirect "/login"
    end
    erb :"/bills/edit.html"
  end

  patch "/bills/:id" do
    @bill = Bill.find(params[:id])
    redirect_if_not_authorized
    if !@bill.save 
      redirect "bills/#{params[:id]}/edit"
    end
    @bill.update(:name => params[:name], :remaining_balance => params[:remaining_balance], :amount_due => params[:amount_due], :due_date => params[:due_date], :category => params[:category])
    redirect "/bills/#{params[:id]}"
  end
  
  delete "/bills/:id/delete" do
    @bill = Bill.find_by_id(params[:id])
    redirect_if_not_authorized
    if is_logged_in? && current_user.bills.include?(@bill)
      @bill.destroy
      redirect "/bills"
    else
      redirect "/bills/#{@bill.id}"
    end
  end
end
