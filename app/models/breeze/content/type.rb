module Breeze
  module Content
    class Type 
      include Mongoid::Document

      field :name, type: String

      attr_accessible :name, :content_fields

      validates :name, 
        uniqueness: true, 
        presence: true,
        format: { with: /^[\w\d\s-]*$/, 
          message: "Can contain only digits, letters, space, dashes and" +
          " underscores." }
      index({ name: 1 }, { unique: true }) # Uniqueness index

      embeds_many :content_fields,
        class_name: "Breeze::Content::Custom::Field",
        inverse_of: :content_type

      accepts_nested_attributes_for :content_fields, 
        :allow_destroy => true

      def default_template_name
        name.parameterize
      end

    end
  end
end
