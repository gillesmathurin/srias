class UrlValidator < ActiveModel::EachValidator
  REGEXP = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
    
  def validate_each(object, attribute, value)  
    unless value =~ REGEXP
      object.errors[attribute] << (options[:message] || I18n.t("url_format_error"))
    end  
  end
end