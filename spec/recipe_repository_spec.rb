require_relative '../lib/recipe_repository'

RSpec.describe 'RecipeRepository' do
  def reset_recipies_table
    seed_sql = File.read('spec/seeds_recipies_directory.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipies_directory_test' })
    connection.exec(seed_sql)
  end
  
    before(:each) do 
      reset_recipies_table
    end
    
    it "returns all recipies in the table" do
      repo = RecipeRepository.new
      recipe = repo.all
      expect(recipe.length).to eq 2
      expect(recipe[0].id).to eq '1'
      expect(recipe[0].recipe_name).to eq 'Victoria Sponge Cake'
      expect(recipe[0].average_cooking_time_in_minutes).to eq '70'
      expect(recipe[0].rating).to eq '4'

      expect(recipe[1].id).to eq '2'
      expect(recipe[1].recipe_name).to eq 'Lasagne'
      expect(recipe[1].average_cooking_time_in_minutes).to eq '170'
      expect(recipe[1].rating).to eq '5'
    end

    describe 'Find(id)' do
      it 'returns the entry associated with the id' do
        repo = RecipeRepository.new
        recipe = repo.find(2)
        expect(recipe.id).to eq '2'
        expect(recipe.recipe_name).to eq 'Lasagne'
        expect(recipe.average_cooking_time_in_minutes).to eq '170'
        expect(recipe.rating).to eq '5'
      end
    end
end