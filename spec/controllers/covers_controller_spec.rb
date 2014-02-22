require 'spec_helper'

describe Admin::CoversController do

  let(:valid_attributes) { { "title" => "test" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all covers as @covers" do
      cover = Cover.create! valid_attributes
      get :index, {}, valid_session
      assigns(:covers).should eq([cover])
    end
  end

  describe "GET show" do
    it "assigns the requested cover as @cover" do
      cover = Cover.create! valid_attributes
      get :show, {:id => cover.to_param}, valid_session
      assigns(:cover).should eq(cover)
    end
  end

  describe "GET new" do
    it "assigns a new cover as @cover" do
      get :new, {}, valid_session
      assigns(:cover).should be_a_new(Cover)
    end
  end

  describe "GET edit" do
    it "assigns the requested cover as @cover" do
      cover = Cover.create! valid_attributes
      get :edit, {:id => cover.to_param}, valid_session
      assigns(:cover).should eq(cover)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cover" do
        expect {
          post :create, {:cover => valid_attributes}, valid_session
        }.to change(Cover, :count).by(1)
      end

      it "assigns a newly created cover as @cover" do
        post :create, {:cover => valid_attributes}, valid_session
        assigns(:cover).should be_a(Cover)
        assigns(:cover).should be_persisted
      end

      it "redirects to the created cover" do
        post :create, {:cover => valid_attributes}, valid_session
        response.should redirect_to(admin_covers_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cover as @cover" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cover.any_instance.stub(:save).and_return(false)
        post :create, {:cover => { "article_id" => "invalid value" }}, valid_session
        assigns(:cover).should be_a_new(Cover)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cover.any_instance.stub(:save).and_return(false)
        post :create, {:cover => { "article_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cover" do
        cover = Cover.create! valid_attributes
        Cover.any_instance.should_receive(:update).with({ "article_id" => "1" })
        put :update, {:id => cover.to_param, :cover => { "article_id" => "1" }}, valid_session
      end

      it "assigns the requested cover as @cover" do
        cover = Cover.create! valid_attributes
        put :update, {:id => cover.id, :cover => valid_attributes}, valid_session
        assigns(:cover).should eq(cover)
      end

      it "redirects to the admin covers path" do
        cover = Cover.create! valid_attributes
        put :update, {:id => cover.to_param, :cover => valid_attributes}, valid_session
        response.should redirect_to(admin_covers_path)
      end
    end

    describe "with invalid params" do
      it "assigns the cover as @cover" do
        cover = Cover.create! valid_attributes
        Cover.any_instance.stub(:save).and_return(false)
        put :update, {:id => cover.to_param, :cover => { "article_id" => "invalid value" }}, valid_session
        assigns(:cover).should eq(cover)
      end

      it "re-renders the 'edit' template" do
        cover = Cover.create! valid_attributes
        Cover.any_instance.stub(:save).and_return(false)
        put :update, {:id => cover.to_param, :cover => { "article_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cover" do
      cover = Cover.create! valid_attributes
      expect {
        delete :destroy, {:id => cover.to_param}, valid_session
      }.to change(Cover, :count).by(-1)
    end

    it "redirects to the covers list" do
      cover = Cover.create! valid_attributes
      delete :destroy, {:id => cover.to_param}, valid_session
      response.should redirect_to(admin_covers_url)
    end
  end

end
