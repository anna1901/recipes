import React, { useState } from "react";
import RecipeModal from '../RecipeModal/RecipeModal'


const RecipeCard = ( props ) => {
  const [modalOpen, setModalOpen] = useState(false);
   const closeModal = () => {
     setModalOpen(false);
   };
   const openModal = () => {
     setModalOpen(true);
   };
   const recipe = props.recipe

  return (
    <div className="col-md-6 col-lg-4">
        <div className="card mb-4">
          <img
            src={recipe.image}
            className="card-img-top"
            alt={`${recipe.name} image`}
          />
          <div className="card-body">
            <h5 className="card-title">{recipe.name}</h5>
            <button onClick={openModal} className="btn custom-button">Check Recipe</button>
          </div>
        </div>
        <RecipeModal isOpen={modalOpen} closeModal={closeModal} recipe={recipe} />
      </div>
  )
}

export default RecipeCard
