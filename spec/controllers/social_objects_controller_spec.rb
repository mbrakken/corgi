require 'spec_helper'

describe SocialObjectsController do

  # This should return the minimal set of attributes required to create a valid
  # SocialObject. As you add validations to SocialObject, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "corgi_foreign_key" => "1" } }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SocialObjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all social_objects as @social_objects" do
      social_object = SocialObject.create! valid_attributes
      get :index, {}, valid_session
      assigns(:social_objects).should eq([social_object])
    end
  end

  describe "GET show" do
    it "assigns the requested social_object as @social_object" do
      social_object = SocialObject.create! valid_attributes
      get :show, {:id => social_object.to_param}, valid_session
      assigns(:social_object).should eq(social_object)
    end
  end

  describe "GET new" do
    it "assigns a new social_object as @social_object" do
      get :new, {}, valid_session
      assigns(:social_object).should be_a_new(SocialObject)
    end
  end

  describe "GET edit" do
    it "assigns the requested social_object as @social_object" do
      social_object = SocialObject.create! valid_attributes
      get :edit, {:id => social_object.to_param}, valid_session
      assigns(:social_object).should eq(social_object)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SocialObject" do
        expect {
          post :create, {:social_object => valid_attributes}, valid_session
        }.to change(SocialObject, :count).by(1)
      end

      it "assigns a newly created social_object as @social_object" do
        post :create, {:social_object => valid_attributes}, valid_session
        assigns(:social_object).should be_a(SocialObject)
        assigns(:social_object).should be_persisted
      end

      it "redirects to the created social_object" do
        post :create, {:social_object => valid_attributes}, valid_session
        response.should redirect_to(SocialObject.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved social_object as @social_object" do
        # Trigger the behavior that occurs when invalid params are submitted
        SocialObject.any_instance.stub(:save).and_return(false)
        post :create, {:social_object => { "corgi_foreign_key" => "invalid value" }}, valid_session
        assigns(:social_object).should be_a_new(SocialObject)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SocialObject.any_instance.stub(:save).and_return(false)
        post :create, {:social_object => { "corgi_foreign_key" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested social_object" do
        social_object = SocialObject.create! valid_attributes
        # Assuming there are no other social_objects in the database, this
        # specifies that the SocialObject created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SocialObject.any_instance.should_receive(:update).with({ "corgi_foreign_key" => "1" })
        put :update, {:id => social_object.to_param, :social_object => { "corgi_foreign_key" => "1" }}, valid_session
      end

      it "assigns the requested social_object as @social_object" do
        social_object = SocialObject.create! valid_attributes
        put :update, {:id => social_object.to_param, :social_object => valid_attributes}, valid_session
        assigns(:social_object).should eq(social_object)
      end

      it "redirects to the social_object" do
        social_object = SocialObject.create! valid_attributes
        put :update, {:id => social_object.to_param, :social_object => valid_attributes}, valid_session
        response.should redirect_to(social_object)
      end
    end

    describe "with invalid params" do
      it "assigns the social_object as @social_object" do
        social_object = SocialObject.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SocialObject.any_instance.stub(:save).and_return(false)
        put :update, {:id => social_object.to_param, :social_object => { "corgi_foreign_key" => "invalid value" }}, valid_session
        assigns(:social_object).should eq(social_object)
      end

      it "re-renders the 'edit' template" do
        social_object = SocialObject.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SocialObject.any_instance.stub(:save).and_return(false)
        put :update, {:id => social_object.to_param, :social_object => { "corgi_foreign_key" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested social_object" do
      social_object = SocialObject.create! valid_attributes
      expect {
        delete :destroy, {:id => social_object.to_param}, valid_session
      }.to change(SocialObject, :count).by(-1)
    end

    it "redirects to the social_objects list" do
      social_object = SocialObject.create! valid_attributes
      delete :destroy, {:id => social_object.to_param}, valid_session
      response.should redirect_to(social_objects_url)
    end
  end

end
