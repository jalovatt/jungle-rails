require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do

    it "should succesfully validate with valid attributes" do
      @user = User.create(
        first_name: "Ford",
        last_name: "Prefect",
        email: "hoopy.frood@betelgeuse.net",
        password: "a1b2c3d4",
        password_confirmation: "a1b2c3d4"
      )
      expect(@user).to be_valid
    end

    describe "invalid attributes:" do
      it "should not validate without a first name" do
        @user = User.create(
          last_name: "Prefect",
          email: "hoopy.frood@betelgeuse.net",
          password: "a1b2c3d4",
          password_confirmation: "a1b2c3d4"
        )
        expect(@user).to_not be_valid
      end

      it "should not validate without a last name" do
        @user = User.create(
          first_name: "Ford",
          email: "hoopy.frood@betelgeuse.net",
          password: "a1b2c3d4",
          password_confirmation: "a1b2c3d4"
        )
        expect(@user).to_not be_valid
      end

      it "should not validate without an email address" do
        @user = User.create(
          first_name: "Ford",
          last_name: "Prefect",
          password: "a1b2c3d4",
          password_confirmation: "a1b2c3d4"
        )
        expect(@user).to_not be_valid
      end

      it "should not validate without a legal email address" do
        @user = User.create(
          first_name: "Ford",
          last_name: "Prefect",
          email: "hoopy.froodbetelgeuse.net",
          password: "a1b2c3d4",
          password_confirmation: "a1b2c3d4"
        )
        expect(@user).to_not be_valid
      end

      it "should not validate if the email has already been registered" do
        @existing = User.create(
          first_name: "Arthur",
          last_name: "Dent",
          email: "monkeyman@zz9.pza",
          password: "a1b2c3d4",
          password_confirmation: "a1b2c3d4"
        )
        @user = User.create(
          first_name: "Ford",
          last_name: "Prefect",
          email: "monkeyman@zz9.pza",
          password: "a1b2c3d4",
          password_confirmation: "a1b2c3d4"
        )
        expect(@user).to_not be_valid
      end

      it "should not validate without a password" do
        @user = User.create(
          first_name: "Ford",
          last_name: "Prefect",
          email: "hoopy.frood@betelgeuse.net"
        )
        expect(@user).to_not be_valid
      end

      it "should not validate if the password < 8 characters" do
        @user = User.create(
          first_name: "Ford",
          last_name: "Prefect",
          email: "hoopy.frood@betelgeuse.net",
          password: "a1b2c3",
          password_confirmation: "a1b2c3"
        )
        expect(@user).to_not be_valid
      end

      it "should not validate if the password and confirmation differ" do
        @user = User.create(
          first_name: "Ford",
          last_name: "Prefect",
          email: "hoopy.frood@betelgeuse.net",
          password: "a1b2c3d4",
          password_confirmation: "a2b2c3d4"
        )
        expect(@user).to_not be_valid
      end

    end
  end

  describe ".authenticate_with_credentials" do

    it "should authenticate with valid credentials" do
      @user = User.create(
        first_name: "Ford",
        last_name: "Prefect",
        email: "hoopy.frood@betelgeuse.net",
        password: "a1b2c3d4",
        password_confirmation: "a1b2c3d4"
      )
      @auth = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@auth).to be_truthy
    end

    it "should not authenticate with an incorrect email" do
      @user = User.create(
        first_name: "Ford",
        last_name: "Prefect",
        email: "hoopy.frood@betelgeuse.net",
        password: "a1b2c3d4",
        password_confirmation: "a1b2c3d4"
      )
      @auth = User.authenticate_with_credentials("bob@example.com", @user.password)
      expect(@auth).to be_nil
    end

    it "should not authenticate with an incorrect password" do
      @user = User.create(
        first_name: "Ford",
        last_name: "Prefect",
        email: "hoopy.frood@betelgeuse.net",
        password: "a1b2c3d4",
        password_confirmation: "a1b2c3d4"
      )
      @auth = User.authenticate_with_credentials(@user.email, "123234234")
      expect(@auth).to be_nil
    end

    it "should authenticate a correct email address with leading/trailing spaces" do
      @user = User.create(
        first_name: "Ford",
        last_name: "Prefect",
        email: "hoopy.frood@betelgeuse.net",
        password: "a1b2c3d4",
        password_confirmation: "a1b2c3d4"
      )
      @auth = User.authenticate_with_credentials("  hoopy.frood@betelgeuse.net  ", "a1b2c3d4")
      expect(@auth).to be_truthy
    end

    it "should authenticate a correct email address regardless of case" do
      @user = User.create(
        first_name: "Ford",
        last_name: "Prefect",
        email: "hoopy.frood@betelgeuse.net",
        password: "a1b2c3d4",
        password_confirmation: "a1b2c3d4"
      )
      @auth = User.authenticate_with_credentials("hoopY.FrooD@betElgeuSe.net", "a1b2c3d4")
      expect(@auth).to be_truthy
    end



  end
end
