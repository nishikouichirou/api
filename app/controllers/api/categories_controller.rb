module Api
  class CategoriesController < Api::ApplicationController
    def idea_list
      @data = []
      count = 1

      if params[:category_name]
        category = Category.find_by(name: params[:category_name])
        if category
          category.ideas.each.with_index(1) do |idea, i|
            idea_data = {}
            idea_data["id"] = i
            idea_data["category"] = category.name
            idea_data["body"] = idea.body
            @data << idea_data
          end
        else
          render status: 404, json: { status: 404, message: "見つかりませんでした" }
        end
      else
        categories = Category.all
        categories.each do |category|
          category.ideas.each do |idea|
            idea_data = {}
            idea_data["id"] = count
            idea_data["category"] = category.name
            idea_data["body"] = idea.body
            @data << idea_data
            count += 1
          end
        end
      end
    end

    def create_idea
      if params[:category_name] && params[:body]
        category = Category.find_by(name: params[:category_name])
        if category
          Idea.create(category_id: category.id, body: params[:body])
          render status: 200, json: { status: 200, message: "成功" }
        else
          new_category = Category.create(name: params[:category_name])
          Idea.create(category_id: new_category.id, body: params[:body])
          render status: 200, json: { status: 200, message: "成功" }
        end
      else
        render status: 422, json: { status: 422, message: "バリデーションエラー" }
      end
    end
  end
end