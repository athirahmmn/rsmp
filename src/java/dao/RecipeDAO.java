package dao;

import com.rspm.model.Recipe;
import connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecipeDAO {

    public boolean saveRecipe(Recipe recipe) {
        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO recipes (user_id, recipe_name, recipe_image, recipe_description, category, servings, ingredients, instructions) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, recipe.getUserId());
            stmt.setString(2, recipe.getRecipeName());
            stmt.setString(3, recipe.getRecipeImage());
            stmt.setString(4, recipe.getRecipeDescription());
            stmt.setString(5, recipe.getCategory());
            stmt.setInt(6, recipe.getServings());
            stmt.setString(7, recipe.getIngredients());
            stmt.setString(8, recipe.getInstructions());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Recipe> getAllRecipes() {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM recipes";
        List<Recipe> recipes = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Recipe recipe = new Recipe();
                recipe.setRecipeId(rs.getInt("recipe_id"));
                recipe.setUserId(rs.getInt("user_id"));
                recipe.setRecipeName(rs.getString("recipe_name"));
                recipe.setRecipeImage(rs.getString("recipe_image"));
                recipe.setRecipeDescription(rs.getString("recipe_description"));
                recipe.setCategory(rs.getString("category"));
                recipe.setServings(rs.getInt("servings"));
                recipe.setIngredients(rs.getString("ingredients"));
                recipe.setInstructions(rs.getString("instructions"));
                recipes.add(recipe);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recipes;
    }

    public Recipe getRecipeById(int recipeId) {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM recipes WHERE recipe_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, recipeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Recipe recipe = new Recipe();
                recipe.setRecipeId(rs.getInt("recipe_id"));
                recipe.setUserId(rs.getInt("user_id"));
                recipe.setRecipeName(rs.getString("recipe_name"));
                recipe.setRecipeImage(rs.getString("recipe_image"));
                recipe.setRecipeDescription(rs.getString("recipe_description"));
                recipe.setCategory(rs.getString("category"));
                recipe.setServings(rs.getInt("servings"));
                recipe.setIngredients(rs.getString("ingredients"));
                recipe.setInstructions(rs.getString("instructions"));
                return recipe;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Recipe> getMealPlanHistory(int userId) {
        List<Recipe> history = new ArrayList<>();
        String query = "SELECT r.* FROM meal_plans mp JOIN recipes r ON mp.recipe_id = r.recipeId WHERE mp.user_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Recipe recipe = new Recipe();
                    recipe.setRecipeId(rs.getInt("recipeId"));
                    recipe.setUserId(rs.getInt("userId"));
                    recipe.setRecipeName(rs.getString("recipeName"));
                    recipe.setRecipeImage(rs.getString("recipeImage"));
                    recipe.setCategory(rs.getString("category"));
                    recipe.setServings(rs.getInt("servings"));
                    recipe.setIngredients(rs.getString("ingredients"));
                    recipe.setInstructions(rs.getString("instructions"));
                    recipe.setCreatedAt(rs.getString("created_at"));
                    history.add(recipe);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return history;
    }
    
    public boolean updateRecipe(Recipe recipe) {
        String query = "UPDATE recipes SET recipeName = ?, recipeImage = ?, category = ?, servings = ?, ingredients = ?, instructions = ?, created_at = ? WHERE recipeId = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, recipe.getRecipeName());
            ps.setString(2, recipe.getRecipeImage());
            ps.setString(3, recipe.getCategory());
            ps.setInt(4, recipe.getServings());
            ps.setString(5, recipe.getIngredients());
            ps.setString(6, recipe.getInstructions());
            ps.setString(7, recipe.getCreatedAt());
            ps.setInt(8, recipe.getRecipeId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteRecipe(int recipeId) {
        String query = "DELETE FROM recipes WHERE recipeId = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, recipeId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}