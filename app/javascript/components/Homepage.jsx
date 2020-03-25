import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "./HomepageHeader";
import Recipes from "./Recipes";
import Recipe from "./Recipe";
import NewRecipe from "./NewRecipe";
import HomepageHeader from "./HomepageHeader";

const Homepage = () => {
    return(
      <div>
        <HomepageHeader />
        <Recipes />
      </div>
    );
  }

export default Homepage;
