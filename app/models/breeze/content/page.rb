module Breeze
  module Content
    class Page < NavigationItem
      include Mixins::Container
      
      def variables_for_render
        super.merge :page => self
      end
      
      def editable?
        true
      end
      
      def self.[](permalink)
        where(:permalink => permalink).first
      end
    end
  end
end