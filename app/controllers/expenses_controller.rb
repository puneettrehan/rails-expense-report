class ExpensesController < ApplicationController
  before_filter :require_login

  def new
    @expense = current_user.expenses.build
  end

  def create
    @expense = current_user.expenses.build(params[:expense])
    if @expense.save
      redirect_to expenses_path()
    else
      render "new"
    end
  end

  def index
    @expenses = current_user.expenses.includes(:expense_type)
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  def update
    @expense = current_user.expenses.find(params[:id])
    if @expense.update_attributes(params[:expense])
      flash[:notice] = "Expense updated successfully"
      redirect_to expenses_path
    else
      render "edit"
    end
  end

  def destroy
    expense = current_user.expenses.find(params[:id])
    expense.destroy
    redirect_to :back
  end
end