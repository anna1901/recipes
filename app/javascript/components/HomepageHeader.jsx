import React from "react";

const HomepageHeader = (props) => {
  const renderButton = (signed_in) => {
    if(signed_in) {
      return <a href="/recipes" className="btn btn-lg custom-button">View all Recipes</a>
    } else {
      return <a href="/users/sign_up" className="btn btn-lg custom-button">Sign Up</a>
    };
  }
  return(
    <div className="vw-100 vh-40 primary-color d-flex align-items-center justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
      <div className="container secondary-color">
        <h1 className="display-4">Food Recipes</h1>
        <p className="lead">
          A carefully selected list of recipes for the best homemade meal and delicacies.
        </p>
        <hr className="my-4" />
        { renderButton(props.signed_in) }
      </div>
    </div>
  </div>
  );
}

export default HomepageHeader
