class AlternativesController < ApplicationController
  before_action :creator?
  before_action :valid_params?

  def new
    @alternative = Alternative.new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @alternatives = Alternative.where(question_id: @question.id)
  end

  def create
    alternative = Alternative.new(alternative_params)
    begin
      alternative.question_id = params[:question_id]
      alternative.save!
    rescue StandardError => e
      flash[:error] = "Não foi possível criar alternativa (#{e})."
    ensure
      redirect_to new_alternative_path(alternative.question.quiz_id, alternative.question_id)
    end
  end

  def edit
    if Alternative.exists?(id: params[:alternative_id])
      @alternative = Alternative.find(params[:alternative_id])
    else
      flash[:error] = 'Alternativa não encontrada!'
      redirect_to new_alternative_path(alternative.question.quiz_id, alternative.question_id)
    end
  end

  def update
    alternative = Alternative.find(params[:alternative_id])

    begin
      alternative.update!(alternative_params)
      flash[:success] = 'Alternativa adicionada!'
      redirect_to new_alternative_path(alternative.question.quiz_id, alternative.question_id)
    rescue StandardError => e
      flash[:error] = "Não foi possível criar alternativa (#{e})."
      redirect_to edit_alternative_path(alternative.question.quiz_id, alternative.question_id, alternative.id)
    end
  end

  def destroy
    if Alternative.exists?(id: params[:alternative_id])
      alternative = Alternative.find(params[:alternative_id])
      begin
        alternative.destroy!
        flash[:success] = 'Alternativa removida!'
      rescue StandardError => e
        flash[:error] = "Não foi possível remover a alternativa (#{e})."
      end
    end
    redirect_to new_alternative_path(alternative.question.quiz_id, alternative.question_id)
  end

  private

  def alternative_params
    params.require(:alternative).permit(
      'body',
      'correct_answer'
    )
  end

  def valid_params?
    redirect_to index_quiz_path unless Quiz.exists?(id: params[:quiz_id]) && Question.exists?(id: params[:question_id])
  end
end
