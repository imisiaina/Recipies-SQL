require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipies_directory')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id,recipe_name, average_cooking_time_in_minutes, rating FROM recipies;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
recipe_repository = RecipeRepository.new

recipe_repository.all.each { |recipe| 
p "#{recipe.id} - #{recipe.recipe_name} - #{recipe.average_cooking_time_in_minutes} - #{recipe.rating}"
}