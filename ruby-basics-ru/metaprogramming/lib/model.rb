# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
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

      alias_method "#{attribute_name}_setter", "#{attribute_name}="
      ########

      # Default
      define_method "#{attribute_name}_default" do
        method("#{attribute_name}=").call(options[:default])
      end
      #########
    end
  end

  def set_defaults
    methods
      .filter { |m| m[-8..] == '_default' }
      .each { |default| method(default).call }
  end

  def initialize(attributes = {})
    set_defaults
    methods
      .filter { |m| m[-7..] == '_setter' }
      .each do |setter|
        key = setter[...-7].to_sym
        method(setter).call(attributes[key]) if attributes.key? key
      end
  end

  def attributes
    instance_variables.each_with_object({}) do |var, acc|
      name = var[1..].to_sym
      acc[name] = method(name).call
    end
  end

  def value_type_convert(value, type)
    return nil if value.nil?

    case type
    when :datetime
      DateTime.parse(value)
    else
      value
    end
  end
end
# END
