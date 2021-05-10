module Api
  module V1
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

      def update
        alternative = Alternative.find(params[:id])
        alternative.update!(alternative_params)

        render alternative, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
      end

      def index
        alternatives = Alternative.select(
          'id', 'body', 'correct_answer?', 'question_id'
        )
        render json: alternatives, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
      end

      def delete
        alternative = Alternative.find(params[:id])
        alternative.destroy!

        render json: {notice: 'Alternativa excluída com sucesso!'}, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
      end

      def show
        alternative = Alternative.where(id: params[:id]).select(
          'id', 'body', 'correct_answer?', 'question_id'
        ) if Alternative.find(params[:id])

        render json: alternative, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Not found',
          message: "#{e}!"
        }, status: :not_found
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
  end
end
