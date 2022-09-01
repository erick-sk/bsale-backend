class FindProducts
  attr_reader :products

  def initialize(products = initial_scope)
    @products = products
  end

  def call(params = {})
    scoped = products
    scoped = filter_by_query_text(scoped, params[:query_text])
  end

  private

    def initial_scope
      Product.all
    end

    def filter_by_query_text(scoped, query_text)
      return scoped unless query_text.present?

      scoped.where('name LIKE?', "%#{query_text}%")
    end
end