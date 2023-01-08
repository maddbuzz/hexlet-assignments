# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(attributes = {})
    attributes.each do |(k, v)|
      instance_variable_set "@#{k}", v
    end
  end

  def attributes
    instance_variables.each_with_object({}) do |var, acc|
      name = var[1..].to_sym
      m = method(name)
      acc[name] = m.call
    end
  end

  def value_type_convert(value, type)
    case type
    when :datetime
      DateTime.parse(value)
    else
      value
    end
  end

  module ClassMethods
    def attribute(attribute_name, options = {})
      # Getter
      define_method attribute_name.to_s do
        value = instance_variable_get "@#{attribute_name}"
        value_type_convert(value, options[:type])
      end
      ########

      # Setter
      define_method "#{attribute_name}=" do |value|
        instance_variable_set "@#{attribute_name}", value
      end
      ########
    end
  end
end
# END
