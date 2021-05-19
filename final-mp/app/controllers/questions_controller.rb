class QuestionsController < ApplicationController
  before_action :creator?
  before_action :valid_params?

  def new
    @question = Question.new
    @quiz = Quiz.find(params[:quiz_id])
    @questions = Question.where(quiz_id: @quiz.id)
  end

  def create
    question = Question.new(question_params)
    begin
      question.quiz_id = params[:quiz_id]
      question.save!
    rescue StandardError => e
      flash[:error] = "Não foi possível criar questao (#{e})."
    ensure
      redirect_to new_question_path(question.quiz_id)
    end
  end

  def edit
    if Question.exists?(id: params[:question_id])
      @question = Question.find(params[:question_id])
      @quiz = Quiz.find(@question.quiz_id)
      @count_alternatives = Alternative.where(question_id: @question.id).count
    else
      flash[:error] = 'Questão não encontrada!'
      redirect_to new_question_path(question.quiz_id)
    end
  end

  def update
    question = Question.find(params[:question_id])

    begin
      question.update!(question_params)
      flash[:success] = 'Questão adicionada!'
      redirect_to new_question_path(question.quiz_id)
    rescue StandardError => e
      flash[:error] = "Não foi possível criar alternativa (#{e})."
      redirect_to edit_question_path(question.quiz_id, question)
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
    redirect_to new_question_path(question.quiz_id)
  end

  private

  def question_params
    params.require(:question).permit(
      :statement,
      :category,
      :grade
    )
  end

  def valid_params?
    redirect_to index_quiz_path unless Quiz.exists?(id: params[:quiz_id])
  end
end
