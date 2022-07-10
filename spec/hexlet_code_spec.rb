# frozen_string_literal: true

User = Struct.new(:name, :job, keyword_init: true)

RSpec.describe HexletCode do
  context "tag generator" do
    it "should return single tag" do
      expect(HexletCode::Tag.build("br")).to match("<br>")
    end

    it "should return single tag with attribute" do
      expect(HexletCode::Tag.build("img", src: "path/to/image")).to match('<img src="path/to/image">')
    end

    it "should return single tag with multiple attributes" do
      expect(HexletCode::Tag.build("input", type: "submit",
                                            value: "Save")).to match('<input type="submit" value="Save">')
    end

    it "should return multiple tag with text" do
      expect(HexletCode::Tag.build("label") { "Email" }).to match("<label>Email</label>")
    end

    it "should return multiple tag with text with attributes" do
      expect(HexletCode::Tag.build("label", for: "email") { "Email" }).to match('<label for="email">Email</label>')
    end

    it "should return multiple tag" do
      expect(HexletCode::Tag.build("div")).to match("<div></div>")
    end
  end

  before(:all) do
    @user = User.new name: "rob"
  end

  context "form" do
    it "should generate form" do
      form = HexletCode.form_for(@user)
      expect(form).to match('<form action="#" method="post"></form>')
    end

    it "should generate form with url" do
      form = HexletCode.form_for(@user, url: "/users")
      expect(form).to match('<form action="/users" method="post"></form>')
    end
  end
end
