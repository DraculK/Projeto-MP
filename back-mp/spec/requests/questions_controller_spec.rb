require 'rails_helper'

RSpec.describe Api::V1::QuestionsController, :type => :controller do
    #CREATE
    context "#create" do
        let(:quiz) {create(:quiz)}
        let(:params) {
            {statement: 'testessss', category: 'Dissertativa', grade: 2, quiz_id: quiz.id}
        }
        it "create a question" do
            post :create, params: {question: params}
            expect(response).to have_http_status(:created)
        end

        let(:no_statement_params) {
            {statement: '', category: 'Dissertativa', grade: 2, quiz_id: quiz.id}
        }
        it "should not create question with no statement" do
            post :create, params: {question: no_statement_params}
            expect(response).to have_http_status(:bad_request)
        end

        let(:no_category_params) {
            {statement: 'teste', category: '', grade: 2, quiz_id: quiz.id}
        }
        it "should not create question with no category" do
            post :create, params: {question: no_category_params}
            expect(response).to have_http_status(:bad_request)
        end

        let(:no_grade_params) {
            {statement: 'teste', category: 'teste', grade: '', quiz_id: quiz.id}
        }
        it "should not create question with no grade" do
            post :create, params: {question: no_grade_params}
            expect(response).to have_http_status(:bad_request)
        end

        let(:no_quiz_params) {
            {statement: 'teste', category: 'teste', grade: '2', quiz_id: nil}
        }
        it "should not create question with no quiz" do
            post :create, params: {question: no_quiz_params}
            expect(response).to have_http_status(:bad_request)
        end
    end

    context "#show" do 
        let(:quiz) {create(:quiz)}
        let(:question) {create(:question)}

        it "should return the question" do
            get :show, params: {id: question.id}
            expect(response).to have_http_status(:ok)
        end
    end

    context "#destroy" do 
        let(:quiz) {create(:quiz)}
        let(:question) {create(:question)}

        it "deletes a question" do 
            post :delete, params: {id:question.id}
            expect(Question.find_by(id: question.id)).to be_nil
        end
    end

    context "#update" do 
        let(:quiz) {create(:quiz)}
        let(:question) {create(:question)}
        let(:params) {
            {statement: 'testessss', category: 'Dissertativa', grade: 2.0, quiz_id: quiz.id}
        }

        it "should update question's statement" do
            put :update, params: {id:question.id, question: params}
            question.reload
            expect(question.statement).to eql(params[:statement])
        end

        it "should update question's category" do
            put :update, params: {id:question.id, question: params}
            question.reload
            expect(question.category).to eql(params[:category])
        end

        it "should update question's grade" do
            put :update, params: {id:question.id, question: params}
            question.reload
            expect(question.grade).to eql(params[:grade])
        end

        it "should update question's quiz_id" do
            put :update, params: {id:question.id, question: params}
            question.reload
            expect(question.quiz_id).to eql(params[:quiz_id])
        end
    end
end