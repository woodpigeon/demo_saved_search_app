module Service
  extend ActiveSupport::Concern

  # Convenience method - class method #call will instatiate a new obbject
  # and invoke its #call
  included do
    def self.call(*args)
      new(*args).call
    end
  end
end
