require_relative './recipe'

class RecipeRepository
  def all
    sql = 'SELECT id,recipe_name, average_cooking_time_in_minutes, rating FROM recipies;'
    result = DatabaseConnection.exec_params(sql, [])
    recipes = []

    result.each do |entry| 
      recipe = Recipe.new
      recipe.id  = entry['id']
      recipe.recipe_name = entry['recipe_name']
      recipe.average_cooking_time_in_minutes = entry['average_cooking_time_in_minutes']
      recipe.rating = entry['rating']
      recipes << recipe
    end
    return recipes
  end

  def find(id)
    sql = 'SELECT * FROM recipies WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    entry = result[0]
    recipe = Recipe.new
    recipe.id  = entry['id']
    recipe.recipe_name = entry['recipe_name']
    recipe.average_cooking_time_in_minutes = entry['average_cooking_time_in_minutes']
    recipe.rating = entry['rating']

    return recipe
  end
end
