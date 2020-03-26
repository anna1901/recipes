import React from "react";
import { Link } from "react-router-dom";

export default () => (
  <div className="vw-100 vh-40 primary-color d-flex align-items-center justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
      <div className="container secondary-color">
        <h1 className="display-4">Food Recipes</h1>
        <p className="lead">
          A carefully selected list of recipes for the best homemade meal and delicacies.
        </p>
        <hr className="my-4" />
        <a href="/recipes" className="btn btn-lg custom-button">View all Recipes</a>
      </div>
    </div>
  </div>
);
