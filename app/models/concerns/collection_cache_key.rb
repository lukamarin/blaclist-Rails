module CollectionCacheKey
  extend ActiveSupport::Concern

  module ClassMethods
    def cache_key(params = {})
      scope = if self.scope_attributes?
                scope_attributes.to_param
              else
                'all'.freeze
              end

      amount_ts = pluck('COUNT(*)', "MAX(#{model_name.plural}.updated_at)").flatten.map(&:to_i).join('-')
      mark = params.map{|k,v| "#{k}=#{v}"}.join('&')   

      "#{model_name.plural}/#{scope}-#{amount_ts}_#{mark}"
    end
  end
end
