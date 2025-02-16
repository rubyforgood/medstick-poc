require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/regions", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Region. As you add validations to Region, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "myName" } }
  let(:invalid_attributes) { { "name" => nil } }

  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, is_admin: true) }
  describe "As an admin user" do
    before do
      login_as(admin_user)
    end

    describe "GET /index" do
      it "renders a successful response" do
        Region.create! valid_attributes
        get regions_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        region = Region.create! valid_attributes
        get region_url(region)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_region_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        region = Region.create! valid_attributes
        get edit_region_url(region)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Region" do
          expect {
            post regions_url, params: { region: valid_attributes }
          }.to change(Region, :count).by(1)
        end

        it "redirects to the created region" do
          post regions_url, params: { region: valid_attributes }
          expect(response).to redirect_to(region_url(Region.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Region" do
          expect {
            post regions_url, params: { region: invalid_attributes }
          }.to change(Region, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post regions_url, params: { region: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested region" do
          region = Region.create! valid_attributes
          patch region_url(region), params: { region: new_attributes }
          region.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the region" do
          region = Region.create! valid_attributes
          patch region_url(region), params: { region: new_attributes }
          region.reload
          expect(response).to redirect_to(region_url(region))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          region = Region.create! valid_attributes
          patch region_url(region), params: { region: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested region" do
        region = Region.create! valid_attributes
        expect {
          delete region_url(region)
        }.to change(Region, :count).by(-1)
      end

      it "redirects to the regions list" do
        region = Region.create! valid_attributes
        delete region_url(region)
        expect(response).to redirect_to(regions_url)
      end
    end
  end
end
