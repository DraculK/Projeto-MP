module Api
  module V1
    class QuizzesController < ApplicationController
      def create
        quiz = Quiz.new(quiz_params)
        quiz.save!

        render json: quiz, status: :created
      rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
      end

      def update
        quiz = Quiz.find(params[:id])
        quiz.update!(quiz_params)

        render json: quiz, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
      end

      def index
        quizzes = Quiz.select(
          'id', 'title', 'description', 'grade', 'creator_id'
        )
        render json: quizzes, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
      end

      def delete
        quiz = Quiz.find(params[:id])
        quiz.destroy!

        render json: { notice: 'Questionário excluído com sucesso!' }, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Bad request',
          message: "#{e}!"
        }, status: :bad_request
      end

      def show
        if Quiz.find(params[:id])
          quiz = Quiz.where(id: params[:id]).select(
            'id', 'title', 'description', 'grade', 'creator_id'
          )
        end
        creator = User.where(id: Quiz.find(params[:id]).creator_id).select(
          'id', 'email', 'name'
        )

        render json: {
          questionário: quiz,
          criador: creator
        }, status: :ok
      rescue StandardError => e
        render json: {
          error: 'Not found',
          message: "#{e}!"
        }, status: :not_found
      end

      private

      def quiz_params
        params.require(:quiz).permit(
          'title',
          'description',
          'grade',
          'creator_id'
        )
      end
    end
  end
end
