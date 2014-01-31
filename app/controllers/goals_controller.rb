class GoalsController < ApplicationController

  def create
    goal = current_user.goals.new(params[:goal])

    flash[:errors] = goal.errors.full_messages unless goal.save
    redirect_to user_url(current_user)
  end

  def edit
    @goal = current_user.goals.find(params[:id])
    render :edit
  end

  def update
    @goal = current_user.goals.find(params[:id])

    if @goal.update_attributes(params[:goal])
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    goal = current_user.goals.find(params[:id])

    goal.destroy
    redirect_to user_url(goal.author)
  end

  def complete
    goal = current_user.goals.find(params[:id])

    goal.is_completed = true
    goal.save!

    redirect_to user_url(goal.author)
  end

end
