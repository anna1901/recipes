import React from "react";
import Modal from "react-modal";

import "./RecipeModal.scss";

const customStyles = {
  overlay: {
    backgroundColor: "rgba(0,0,0,.12)"
  },
  content: {
    top: "40%",
    left: "50%",
    right: "auto",
    bottom: "auto",
    marginRight: "-50%",
    transform: "translate(-50%, -50%)",
    border: "none",
    width: "40rem",
    height: "auto",
    background: "white",
    boxShadow: "0 25px 50px -12px rgba(0, 0, 0, 0.5)"
  }
};

Modal.setAppElement();

const RecipeModal = ({ isOpen, closeModal, recipe }) => {
  const ingredientList = (ingredients) => {
    let ingredientList = "No ingredients available";

    if (ingredients && ingredients.length > 0) {
      ingredientList = ingredients
        .split(",")
        .map((ingredient, index) => (
          <li key={index} className="list-group-item">
            {ingredient}
          </li>
        ));
    }
    return ingredientList
  }
  return (
    <Modal
      isOpen={isOpen}
      onRequestClose={closeModal}
      style={customStyles}
      ariaHideApp={false}
      contentLabel="Form Modal"
    >
      <div className="modal-header">
        <h2 className="modal-header-heading">{recipe.name}</h2>
        <span onClick={closeModal} type="button" className="modal-header-close">
          &times;
        </span>
      </div>
      <div className="recipe-content">
        <ul className="list-group">
          <h5 className="mb-2">Ingredients</h5>
          {ingredientList(recipe.ingredients)}
        </ul>
        <a href={`/recipes/${recipe.id}`}>View full Recipe</a>
      </div>
    </Modal>
  );
};

export default RecipeModal;
