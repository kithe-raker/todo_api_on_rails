class Api::V1::TodoController < ApplicationController
    def index
        todo = Todo.order(when: :desc)
        render json: todo,status: :ok
    end

    def show
        todo = Todo.find(params[:id])
        render json: todo,status: :ok
    end

    def create
        todo = Todo.new(todo_params)

        if todo.save 
            render json: todo,status: :ok
        else
            head(:unprocessable_entity)
        end
    end

    def update
        todo = Todo.find(params[:id])

        if todo.update_attributes(todo_params)
            render json: todo,status: :ok
        else   
            head(:unprocessable_entity)
        end
    end

    def destroy
        todo = Todo.find(params[:id])
        if todo.destroy
            head(:ok)
        else 
            head(:unprocessable_entity)
        end
    end

    private def todo_params 
        params.require(:todo,).permit(:title, :desc ,:when, :isFinish)
    end
end
