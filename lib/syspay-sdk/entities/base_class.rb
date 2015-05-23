module SyspaySDK::Entities
  class BaseClass
    include SyspaySDK::AbstractClass

    abstract_methods :to_hash

    attr_accessor :raw

    def get_type
      self::TYPE
    end
  end
end