# frozen_string_literal: true

require_relative "hexlet_code/version"

# Simple form builder
module HexletCode
  class Error < StandardError; end

  # Form Generator
  def self.form_for(*_attributes, url: "#")
    "<form action=\"#{url}\" method=\"post\"></form>"
  end

  # Tag builder
  class Tag
    def self.build(tag, *attributes)
      single_tags = %w[area base br col embed hr img input keygen link meta param
                       source track wbr]
      result_attr = attr_builder(attributes)

      if single_tags.include? tag
        "<#{tag}#{result_attr}>"
      else
        "<#{tag}#{result_attr}>#{yield if block_given?}</#{tag}>"
      end
    end

    def self.attr_builder(attributes)
      result_attr = ""
      attributes.each do |attr|
        result_attr += " #{attr.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")}"
      end
      result_attr
    end
  end
end
