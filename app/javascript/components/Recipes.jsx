import React, { useState } from "react";
import RecipeCard from './RecipeCard/RecipeCard'

class Recipes extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      recipes: [],
    };
  }

  componentDidMount() {
    let url
    if(this.props.user_id) {
      url = `/api/v1/recipes/index?user_id=${this.props.user_id}`;
    } else {
      url = "/api/v1/recipes/index";
    }
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ recipes: response }))
      .catch(() => this.props.history.push("/"));
  }

  render() {
    const { recipes } = this.state;
    const allRecipes = recipes.map((recipe, index) => (
      <RecipeCard recipe={recipe} key={index} />
    ));
    const noRecipe = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No recipes yet. Why not <a href="/recipes/new">create one</a>
        </h4>
      </div>
    );

    const attachCreateRecipeButton = (signed_in) => {
      if(signed_in) {
        return <a href="/recipes/new" className="btn custom-button">Create New Recipe</a>
      }
    }

    let heading
    if(this.props.user_id) {
      heading =
          <div>
            <h1 className="display-4">Your recipes</h1>
          </div>
    } else {
      heading =
        <div>
        <h1 className="display-4">Recipes for every occasion</h1>
          <p className="lead text-muted">
            We’ve pulled together our most popular recipes, our latest
            additions, and our editor’s picks, so there’s sure to be something
            tempting for you to try.
          </p>
        </div>
    }

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5">
            {heading}
          </div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="text-right mb-3">
              {attachCreateRecipeButton(this.props.signed_in)}
            </div>
            <div className="row">
              {recipes.length > 0 ? allRecipes : noRecipe}
            </div>
          </main>
        </div>
      </>
    );
  }
}
export default Recipes;
