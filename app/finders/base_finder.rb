class BaseFinder
  attr_accessor :context, :params, :current_user

  def initialize(context = {})
    @context = context
    @params = context[:params] || {}
    @current_user = context[:current_user]
    @serializer_options = context[:options] || {}
  end

  def default_per_page
    30
  end

  def page
    @params[:page]
  end

  def per_page
    @per_page ||= begin
      params[:per_page].blank? ? default_per_page : params[:per_page]
    end
  end

  def paginate?
    page.present? && page.to_i > 0
  end

  def serialized_collection(serializer)
    if collection.respond_to?(:to_ary)
      @serializer_options[:each_serializer] = serializer
      ActiveModel::ArraySerializer.new(collection.to_ary, @serializer_options).as_json
    else
      serializer.new(collection, @serializer_options).as_json
    end
  end

  def collection
    fail NotImplementedError
  end

  class << self
    def collection(context = {})
      new(context).collection
    end

    def serialized_collection(serializer, context = {})
      new(context).serialized_collection(serializer)
    end
  end
end