require 'rails_helper'

describe CommentsController do
  describe 'GET #index' do
    let(:user) { create(:user)}
    let(:chatgroup) { create(:chatgroup)}
    let(:comment) { create(:comment)}
    let(:comments) {create_list(:comment, 3)}

    context 'user log_in' do
      before do
        login_user user
      end

      it "assigns the requested comment to @comment" do
        get :index, params: {chatgroup_id: chatgroup[:id]}
        expect(assigns(:comment)).to be_an_instance_of Comment
      end

      it "assigns the requested comment to @comments" do
        get :index, params: {chatgroup_id: chatgroup[:id]}
        expect(assigns(:comments)).to match(comments.sort{ |a, b| a.created_at <=> b.created_at })
      end

      it "renders the :index template" do
        get :index, params: {chatgroup_id: chatgroup[:id]}
        expect(response).to render_template :index
      end
    end

    context 'user not log_in' do
      it "redirect to user_session_path" do
        get :index, params: {chatgroup_id: chatgroup[:id]}
        expect(response).to redirect_to user_session_path
      end
    end
  end
  describe 'POST #create' do
    let(:user) { create(:user)}
    let(:chatgroup) { create(:chatgroup)}
    let(:comment) { create(:comment)}

    context 'user log_in and save success' do
      before do
        login_user user
      end

      it 'saves the posted text to @comment ' do
        test_comment = comment.slice(:comment)
        expect{post :create, params: {chatgroup_id: chatgroup[:id],comment: test_comment, user_id: comment[:id],image: comment[:image]}}.to change(Comment, :count).by(1)
      end


      it 'redirect_to chatgroup_comments_path' do
        test_comment = comment.slice(:comment)
        post :create, params: {chatgroup_id: chatgroup[:id],comment: test_comment, user_id: comment[:id],image: comment[:image]}
        expect(response).to redirect_to chatgroup_comments_path
      end
    end

    context 'user log_in but save failed' do
      before do
        login_user user
      end

      it 'does not saves the posted text to @comment ' do
        expect{post :create, params: {chatgroup_id: chatgroup[:id],comment: {comment: "", image: nil}, chatgroup_id: chatgroup.id}}.not_to change(Comment, :count)
      end

      it 'does not saves the posted and redirect_to chatgroup_comments_path' do
        test_comment = comment.slice(:comment)
        post :create, params: {chatgroup_id: chatgroup[:id],comment: test_comment, user_id: comment[:id],image: comment[:image]}
        expect(response).to redirect_to chatgroup_comments_path
      end
    end

    context 'user not log_in' do
      it "redirect to user_session_path" do
        get :index, params: {chatgroup_id: chatgroup[:id]}
        expect(response).to redirect_to user_session_path
      end
    end
  end

end
