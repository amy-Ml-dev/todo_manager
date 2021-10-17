# todos_controller.rb
class TodosController < ApplicationController
  #skip_before_action :verify_authenticity_token

  def index
    if current_user
      render "index"
    else
      redirect_to "/"
    end
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    #render plain: todo.to_pleasent_string
    render "todo"
  end

  def create
    if not current_user
      render plain: "Please login first"
    end
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    if not new_todo.save
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    else
      redirect_to todos_path
    end
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = current_user.todos.find(id)
    todo.completed = completed
    todo.save!
    #render plain: "Updated completed status to #{completed}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
