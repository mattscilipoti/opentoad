require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ErrorsController do

  def mock_error(stubs={})
    @mock_error ||= mock_model(Error, stubs)
  end

  describe "GET index" do
    it "assigns all errors as @errors" do
      Error.stub!(:find).with(:all).and_return([mock_error])
      get :index
      assigns[:errors].should == [mock_error]
    end
  end

  describe "GET show" do
    it "assigns the requested error as @error" do
      Error.stub!(:find).with("37").and_return(mock_error)
      get :show, :id => "37"
      assigns[:error].should equal(mock_error)
    end
  end

  describe "GET new" do
    it "assigns a new error as @error" do
      Error.stub!(:new).and_return(mock_error)
      get :new
      assigns[:error].should equal(mock_error)
    end
  end

  describe "GET edit" do
    it "assigns the requested error as @error" do
      Error.stub!(:find).with("37").and_return(mock_error)
      get :edit, :id => "37"
      assigns[:error].should equal(mock_error)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created error as @error" do
        Error.stub!(:new).with({'these' => 'params'}).and_return(mock_error(:save => true))
        post :create, :error => {:these => 'params'}
        assigns[:error].should equal(mock_error)
      end

      it "redirects to the created error" do
        Error.stub!(:new).and_return(mock_error(:save => true))
        post :create, :error => {}
        response.should redirect_to(error_url(mock_error))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved error as @error" do
        Error.stub!(:new).with({'these' => 'params'}).and_return(mock_error(:save => false))
        post :create, :error => {:these => 'params'}
        assigns[:error].should equal(mock_error)
      end

      it "re-renders the 'new' template" do
        Error.stub!(:new).and_return(mock_error(:save => false))
        post :create, :error => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested error" do
        Error.should_receive(:find).with("37").and_return(mock_error)
        mock_error.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :error => {:these => 'params'}
      end

      it "assigns the requested error as @error" do
        Error.stub!(:find).and_return(mock_error(:update_attributes => true))
        put :update, :id => "1"
        assigns[:error].should equal(mock_error)
      end

      it "redirects to the error" do
        Error.stub!(:find).and_return(mock_error(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(error_url(mock_error))
      end
    end

    describe "with invalid params" do
      it "updates the requested error" do
        Error.should_receive(:find).with("37").and_return(mock_error)
        mock_error.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :error => {:these => 'params'}
      end

      it "assigns the error as @error" do
        Error.stub!(:find).and_return(mock_error(:update_attributes => false))
        put :update, :id => "1"
        assigns[:error].should equal(mock_error)
      end

      it "re-renders the 'edit' template" do
        Error.stub!(:find).and_return(mock_error(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested error" do
      Error.should_receive(:find).with("37").and_return(mock_error)
      mock_error.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the errors list" do
      Error.stub!(:find).and_return(mock_error(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(errors_url)
    end
  end

end
