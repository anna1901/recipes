import React from "react";
import { render } from "react-dom";
import $ from 'jquery';
import Popper from 'popper.js';
import Homepage from "../components/Homepage";
import Recipe from "../components/Recipe";

// import '../stylesheets/application.scss'

document.addEventListener("DOMContentLoaded", () => {
  const homepage = document.getElementById('homepage');
  if (homepage) {
    render(
      <Homepage />,
      homepage
    );
  }

  const recipeShow = document.getElementById('recipe-show');
  if (recipeShow) {
    const node = document.getElementById('recipe_id')
    const data = JSON.parse(node.getAttribute('data'))
    render(
      <Recipe recipe_id={data} />,
      recipeShow
    );
  }
});
