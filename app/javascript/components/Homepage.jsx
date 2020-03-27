import React from "react";
import Recipes from "./Recipes";
import HomepageHeader from "./HomepageHeader";

const Homepage = (props) => {
    return(
      <div>
        <HomepageHeader signed_in={props.signed_in}/>
        <Recipes signed_in={props.signed_in}/>
      </div>
    );
  }

export default Homepage;
