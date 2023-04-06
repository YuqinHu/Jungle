class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @total_count = Product.all.count
    @total_category_count = Category.all.count
  end
end
