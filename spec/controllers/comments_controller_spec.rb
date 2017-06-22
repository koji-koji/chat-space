require 'rails_helper'

describe CommentsController do
  describe 'GET #index' do
    let(:user) { create(:user)}
    let(:group) { create(:chatgroup)}
    let(:comments) { create(:comments)}
    context 'user log_in' do
      before do
        login_user user
      end

      it "assigns the requested comment to @comment" do
        comment = create(:comment)
        get :index, id: comment
        expect(assigns(:comment)).to eq comment
      end


      it "renders the :index template" do
        get :index, id: comment
        # id: 1は渡すパラメータのハッシュ
        expect(response).to render_template :index
      end
    end
  end
  # describe 'POST #create' do
  #   it "assigns the requested comment to @comment"
  #   expect(assigns(:commetn)).to eq comment
  # end

end
