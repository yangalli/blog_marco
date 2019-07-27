class CategoriesController < InheritedResources::Base

  private

    def category_params
      params.require(:category).permit(:name, :description, :display_in_navbar)
    end
end

