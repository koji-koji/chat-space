require 'rails_helper'

describe CommentsController do
  describe 'GET #index' do
    let(:user) { create(:user)}
    let(:chatgroup) { create(:chatgroup)}
    let(:comments) { create_list(:comment, 3, chatgroup_id: chatgroup.id)}
    before do
      get :index, params: {chatgroup_id: chatgroup.id}
    end

    context 'when user log_in' do
      before do
        login_user user
        get :index, params: {chatgroup_id: chatgroup.id}
      end

      it "assign the requested comment to @comment" do
        expect(assigns(:comment)).to be_an_instance_of Comment
      end

      it "assign the requested comments to @comments" do
        expect(assigns(:comments)).to match(comments.sort{ |a, b| a.created_at <=> b.created_at })
      end

      it "render the :index template" do
        expect(response).to render_template :index
      end
    end

    context 'when user not log_in' do
      it "redirect to user_session_path" do
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user)}
    let(:chatgroup) { create(:chatgroup)}

    context 'when user log_in and save success' do
      before do
        login_user user
      end

      it 'save the new comment ' do
        expect{
          post :create, params: {chatgroup_id: chatgroup.id, comment: attributes_for(:comment) , user_id: user.id}
        }.to change(Comment, :count).by(1)
      end

      it 'redirect to chatgroup_comments_path' do
        post :create, params: {chatgroup_id: chatgroup.id, comment: attributes_for(:comment), user_id: user.id }
        expect(response).to redirect_to chatgroup_comments_path
      end
    end

    context 'when user log in but save failed' do
      let(:fail_params) {{ chatgroup_id: chatgroup.id, comment: {comment: "", image: nil}, user_id: user.id}}
      before do
        login_user user
      end

      it 'does not saves the posted text to @comment ' do
        expect{
          post :create, params: fail_params
        }.not_to change(Comment, :count)
      end

      it 'show flash message ' do
        post :create, params: fail_params
        expect(flash.now[:alert]).to include("メッセージかイメージを入力して下さい")
      end

      it 'does not saves the posted and render' do
        post :create, params: fail_params
        expect(response).to render_template :index
      end
    end

    context 'when user not log_in' do
      it "redirect to user_session_path" do
        get :index, params: {chatgroup_id: chatgroup.id}
        expect(response).to redirect_to user_session_path
      end
    end
  end

end
