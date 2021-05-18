class AlternativesController < ApplicationController
    def create
        alternative = Alternative.new(alternative_params)
        alternative.save!

        render json: alternative, status: :created
    rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
    end

    def edit
        if Alternative.exists?(id: params[:id])
          @alternative = Product.find(params[:id])
        else
          redirect_to show_quiz_path
        end
      end

    def update
        alternative = Alternative.find(params[:id])
        alternative.update!(alternative_params)

        render json: alternative, status: :ok
    rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
    end

    def delete
        alternative = Alternative.find(params[:id])
        alternative.destroy!

        render json: { notice: 'Alternativa excluída com sucesso!' }, status: :ok
    rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
    end

private

    def alternative_params
        params.require(:alternative).permit(
          'body',
          'correct_answer?',
          'question_id'
        )
    end
end
