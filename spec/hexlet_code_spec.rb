# frozen_string_literal: true

RSpec.describe HexletCode do
  # it "has a version number" do
  #   expect(HexletCode::VERSION).not_to be nil
  # end

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
end
