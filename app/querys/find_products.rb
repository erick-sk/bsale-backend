class FindProducts
  attr_reader :products

  def initialize(products = initial_scope)
    @products = products
  end

  def call(params = {})
    scoped = products
    scoped = filter_by_query_text(scoped, params[:query_text])
    scoped = filter_by_category_id(scoped, params[:category_id])
  end

  private

    def initial_scope
      Product.all.includes(:category)
    end

    def filter_by_query_text(scoped, query_text)
      return scoped unless query_text.present?

      scoped.where('name LIKE?', "%#{query_text}%")
    end

    def filter_by_category_id(scoped, category_id)
      return scoped unless category_id.present?

      scoped.where(category: category_id)
    end
end