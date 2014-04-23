module ActiveModel
  class Serializer
    module Associations #:nodoc:
      class Config #:nodoc:
        def find_serializable(object)
          if target_serializer
            target_serializer.new(object, source_serializer.options)
          elsif object.respond_to?(:active_model_serializer) && (ams = object.active_model_serializer)
            source_association = source_serializer.object.class.to_s.underscore.downcase
            plural_source_association = source_association+'s'
            except = ams._associations.keys.map(&:to_s).find do |association|
              association == source_association || association == plural_source_association
            end
            _options = source_serializer.options
            _options[:except] = Array(_options[:except])
            if not except.nil?
              if not _options[:except].include? except.to_sym
                _options[:except].push(except.to_sym)
              end
            end
            ams.new(object, _options)
          else
            object
          end
        end
      end
    end
  end
end
