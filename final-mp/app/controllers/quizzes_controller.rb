class QuizzesController < ApplicationController
  before_action :creator?, except: %i[show index]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    quiz = Quiz.new(quiz_params)
    begin
      quiz.creator_id = current_user.id
      quiz.save!
      redirect_to index_quiz_path
    rescue StandardError => e
      flash[:error] = "Não foi possível criar questionário(#{e})."
      redirect_to new_quiz_path
    end
  end

  def edit
    if Quiz.exists?(id: params[:quiz_id])
      @quiz = Quiz.find(params[:quiz_id])
    else
      flash[:error] = 'Questionário não encontrado!'
      redirect_to index_quiz_path
    end
  end

  def update
    quiz = Quiz.find(params[:quiz_id])

    begin
      quiz.update!(quiz_params)
      flash[:success] = 'Questionário atualizado!'
      redirect_to show_quiz_path(:quiz_id)
    rescue StandardError => e
      flash[:error] = "Não foi possível atualizar questionário (#{e})."
      redirect_to edit_quiz_path(:quiz_id)
    end
  end
  
  def destroy
    if Quiz.exists?(id: params[:quiz_id])
      quiz = Quiz.find(params[:quiz_id])
      begin
        quiz.destroy!
        flash[:success] = 'Questionário excluído!'
      rescue StandardError => e
        flash[:error] = "Não foi possível excluir questionário (#{e})."
      end
    end
    redirect_to index_quiz_path(:quiz_id)
  end

private
  def quiz_params
    params.require(:quiz).permit(
      :title,
      :description,
      :grade,
      :anonymous
    )
  end
end
