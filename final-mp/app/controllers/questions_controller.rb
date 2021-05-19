class QuestionsController < ApplicationController

    before_action :creator?
    before_action :valid_params?
        
  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    begin
      question.quiz_id = params[:quiz_id]
      question.save!
      redirect_to edit_quiz_path
    rescue StandardError => e
      flash[:error] = "Não foi possível criar questao (#{e})."
      redirect_to new_question_path(:quiz_id)
    end
  end

  def edit
    if Question.exists?(id: params[:question_id])
      @question = Question.find(params[:question_id])
    else
      flash[:error] = 'Questão não encontrada!'
      redirect_to edit_quiz_path(:quiz_id)
    end
  end

  def update
    question = Question.find(params[:question_id])

    begin
      question.update!(question_params)
      flash[:success] = 'Questão adicionada!'
      redirect_to edit_quiz_path(:quiz_id)
    rescue StandardError => e
      flash[:error] = "Não foi possível criar alternativa (#{e})."
      redirect_to edit_question_path(:quiz_id, :question_id)
    end
  end
  
  def destroy
    if Question.exists?(id: params[:question_id])
      question = Question.find(params[:question_id])
      begin
        question.destroy!
        flash[:success] = 'Questão removida!'
      rescue StandardError => e
        flash[:error] = "Não foi possível remover a questão (#{e})."
      end
    end
    redirect_to edit_quiz_path(:quiz_id)
  end

private
  def question_params
    params.require(:question).permit(
      :statement,
      :category,
      :grade,
    )
  end

  def valid_params?
    unless Quiz.exists?(id: params[:quiz_id])
      redirect_to index_quiz_path
    end
  end
end