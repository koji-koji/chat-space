require 'rails_helper'

describe CommentsController do
  describe 'GET #index' do
    let(:user) { create(:user)}
    let(:chatgroup) { create(:chatgroup)}
    let(:comment) { create(:comment)}
    let(:comments) { create_list(:comment, 3, chatgroup_id: chatgroup.id)}
    before do
      get :index, params: {chatgroup_id: chatgroup.id}
    end

    context 'user log_in' do
      before do
        login_user user
        get :index, params: {chatgroup_id: chatgroup.id}
      end


      it "assigns the requested comment to @comment" do
        expect(assigns(:comment)).to be_an_instance_of Comment
      end

      it "assigns the requested comment to @comments" do
        expect(assigns(:comments)).to match(comments.sort{ |a, b| a.created_at <=> b.created_at })
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    context 'user not log_in' do
      it "redirect to user_session_path" do
        expect(response).to redirect_to user_session_path
      end
    end
  end
  describe 'POST #create' do
    let(:user) { create(:user)}
    let(:chatgroup) { create(:chatgroup)}
    let(:comment) { create(:comment)}
    before do
      @test_comment = comment.slice(:comment,:image)
    end

    context 'user log_in and save success' do
      before do
        login_user user
      end

      it 'saves the posted text to @comment ' do
        expect{post :create, params: {chatgroup_id: chatgroup.id,comment: @test_comment, user_id: comment.user_id}}.to change(Comment, :count).by(1)
      end

      it 'redirect_to chatgroup_comments_path' do
        test_comment = comment.slice(:comment,:image)
        post :create, params: {chatgroup_id: chatgroup.id,comment: @test_comment, user_id: comment.user_id}
        expect(response).to redirect_to chatgroup_comments_path
      end
    end

    context 'user log_in but save failed' do
      before do
        login_user user
      end

      it 'does not saves the posted text to @comment ' do
        expect{post :create, params: {chatgroup_id: chatgroup.id,comment: {comment: "", image: nil}, user_id: comment.user_id}}.not_to change(Comment, :count)
      end

      it 'show flash message ' do
        post :create, params: {chatgroup_id: chatgroup.id,comment: {comment: "", image: nil}, user_id: comment.user_id}
        expect(flash.now[:alert]).to include("メッセージかイメージを入力して下さい")
      end

      it 'does not saves the posted and redirect_to chatgroup_comments_path' do
        post :create, params: {chatgroup_id: chatgroup.id,comment: @test_comment, user_id: comment.user_id}
        expect(response).to redirect_to chatgroup_comments_path
      end
    end

    context 'user not log_in' do
      it "redirect to user_session_path" do
        get :index, params: {chatgroup_id: chatgroup.id}
        expect(response).to redirect_to user_session_path
      end
    end
  end

end
