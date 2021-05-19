class AlternativesController < ApplicationController
    
  before_action :creator?
  before_action :valid_params?

  def new
    @alternative = Alternative.new
  end

  def create
    alternative = Alternative.new(alternative_params)
    begin
      alternative.question_id = params[:question_id]
      alternative.save!
      redirect_to edit_question_path
    rescue StandardError => e
      flash[:error] = "Não foi possível criar alternativa (#{e})."
      redirect_to new_alternative_path(:quiz_id, :question_id)
    end
  end

  def edit
    if Alternative.exists?(id: params[:alternative_id])
      @alternative = Alternative.find(params[:alternative_id])
    else
      flash[:error] = 'Alternativa não encontrada!'
      redirect_to edit_question_path(:quiz_id, :question_id)
    end
  end

  def update
    alternative = Alternative.find(params[:alternative_id])

    begin
      alternative.update!(alternative_params)
      flash[:success] = 'Alternativa adicionada!'
      redirect_to edit_question_path(:quiz_id, :question_id)
    rescue StandardError => e
      flash[:error] = "Não foi possível criar alternativa (#{e})."
      redirect_to edit_alternative_path(:quiz_id, :question_id, :alternative_id)
  
    end
  end

  def destroy
    if Alternative.exists?(id: params[:alternative_id])
      alternative = Alternative.find(params[:id])
      begin
        alternative.destroy!
        flash[:success] = 'Alternativa removida!'
      rescue StandardError => e
        flash[:error] = "Não foi possível remover a alternativa (#{e})."
      end
    end
    redirect_to edit_question_path(:quiz_id, :question_id)
  end

private
  def alternative_params
    params.require(:alternative).permit(
      'body',
      'correct_answer?',
      'question_id'
    )
  end

  def valid_params?
    unless (Quiz.exists?(id: params[:quiz_id]) && Question.exists?(id: params[:question_id]))
      redirect_to index_quiz_path
    end
  end
end
