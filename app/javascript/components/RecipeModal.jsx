import React from "react";
import Modal from "react-modal";

// import "./RecipeModal.scss";
// import CloseIcon from "@material-ui/icons/Close";

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
    boxShadow: "0 25px 50px -12px rgba(0, 0, 0, 0.25)"
  }
};

Modal.setAppElement();

const RecipeModal = ({ isOpen, closeModal }) => {
  return (
    <Modal
      isOpen={isOpen}
      onRequestClose={closeModal}
      style={customStyles}
      ariaHideApp={false}
      contentLabel="Form Modal"
    >
      <div className="modal-header">
        <p className="modal-header-heading">View the recipe</p>
        <span onClick={closeModal} className="modal-header-close">
          x
        </span>
      </div>
      {/* <Form closeModal={closeModal} /> */}
      <p>Content</p>
    </Modal>
  );
};

export default RecipeModal;
