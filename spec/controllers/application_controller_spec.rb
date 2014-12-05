require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      if session[:user_id] = 1
        redirect_to admin_products_path
      else
        redirect_to new_session_path
      end
    end
  end

  describe "Authorisation" do

    context "when user is NOT authorised" do
      it "redirects when the session id is invalid" do
        session[:user_id] = -100
        get :index
        expect(response).to redirect_to("/sessions/new")
      end

    end

    context "when user IS authorised" do
      it "renders the index page when the session id is valid" do
        session[:user_id] = 1
        get :index
        expect(response).to redirect_to(admin_products_path)
      end

    end

  end
end

