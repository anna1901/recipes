import React from "react";
import Recipes from "./Recipes";
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
