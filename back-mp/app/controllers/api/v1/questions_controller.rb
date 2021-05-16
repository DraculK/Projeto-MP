module Api
  module V1
    class QuestionsController < ApplicationController
      def create
        question = Question.new(question_params)
        question.save!

        render question, status: :created
      rescue StandardError
        head(:bad_request)
      end

      def show
        question = Question.find(params[:id])

        head(:ok)
      rescue StandardError
        head(:bad_request)
      end

      def delete
        question = Question.find(params[:id])
        question.destroy!

        render question, status: :ok
      rescue StandardError
        head(:bad_request)
      end

      def update
        question = Question.find(params[:id])
        question.update!(question_params)

        render question, status: :ok
      rescue StandardError
        head(:bad_request)
      end

      private

      def question_params
        params.require(:question).permit(
          :statement,
          :category,
          :grade,
          :quiz_id
        )
      end
    end
  end
end
