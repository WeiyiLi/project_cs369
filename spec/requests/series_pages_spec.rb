require 'spec_helper'

describe "Series pages" do

  subject { page }

  describe "index" do
    before { visit series_index_path }

    it { should have_title('Search series') }
  end

  describe "new page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin) }

    describe "user visit new page" do

      before do
        log_in user
        visit new_series_path
      end

      it { should_not have_content('New series') }
      it { should_not have_title(full_title('New series')) }
    end

    describe "admin visit new page" do

      before do
        log_in admin
        visit new_series_path
      end

      it { should have_content('New series') }
      it { should have_title(full_title('New series')) }



      describe "create series" do

        before { visit new_series_path }

        let(:submit) { "Create this series" }

        describe "with invalid information" do
          it "should not create a series" do
            expect { click_button submit }.not_to change(Series, :count)
          end
        end

        describe "with valid information" do
          before { fill_in "Name", with: "Test Series" } 

          it "should create a series" do
            expect { click_button submit }.to change(Series, :count).by(1)
          end
        end
      end
    end
  end

  describe "edit" do
    let(:series) { FactoryGirl.create(:series) }
    let(:admin) { FactoryGirl.create(:admin) }

    before do
      log_in admin
      visit edit_series_path(series)
    end

    describe "page" do
      it { should have_content("Update series") }
      it { should have_title("Edit series") }
    end

    describe "with valid information" do
      let(:new_name)  { "New Series Name" }
      before do
        fill_in "Name",             with: new_name
        click_button "Save changes"
        visit series_path(series)
      end

      it { should have_title(new_name) }
      specify { expect(series.reload.name).to  eq new_name }
    end
  end
end