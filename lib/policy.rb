module Sprinkle
  module Policy
    class Policy

      def requires(package, options = {})
        @packages << package
        options.each do |k, v|
          "Sprinkle::Package::PACKAGES[package].#{k}(#{v})"
        end
      end

    end
  end
end