require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ErrorsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "errors", :action => "index").should == "/errors"
    end

    it "maps #new" do
      route_for(:controller => "errors", :action => "new").should == "/errors/new"
    end

    it "maps #show" do
      route_for(:controller => "errors", :action => "show", :id => "1").should == "/errors/1"
    end

    it "maps #edit" do
      route_for(:controller => "errors", :action => "edit", :id => "1").should == "/errors/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "errors", :action => "create").should == {:path => "/errors", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "errors", :action => "update", :id => "1").should == {:path =>"/errors/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "errors", :action => "destroy", :id => "1").should == {:path =>"/errors/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/errors").should == {:controller => "errors", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/errors/new").should == {:controller => "errors", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/errors").should == {:controller => "errors", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/errors/1").should == {:controller => "errors", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/errors/1/edit").should == {:controller => "errors", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/errors/1").should == {:controller => "errors", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/errors/1").should == {:controller => "errors", :action => "destroy", :id => "1"}
    end
  end
end
