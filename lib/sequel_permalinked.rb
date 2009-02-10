module Sequel
  module Plugins
    module Permalinked
      def self.apply(model, options = {})
        options.each do |link,text|
          model.class_eval "before_validation { self.#{link} = self.class.permalink_for(self.#{text}) if self.#{link}.nil? || self.#{link}.empty? }"
        end
      end

      module ClassMethods
        def permalink_for(text)
          text.dup.strip.downcase.gsub(/\W+/,'-')
        end
      end
    end
  end
end
