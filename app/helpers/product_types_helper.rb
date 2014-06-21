module ProductTypesHelper
  def get_product_type_name(product_type_id)
    return ProductType.find(product_type_id)
  end
end
