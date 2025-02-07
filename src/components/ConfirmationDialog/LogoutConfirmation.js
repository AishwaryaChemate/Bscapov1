import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './Logout.css'; // Import the CSS file you just created

function LogoutConfirmation({ show, onHide, onConfirm }) {
  return (
    <Modal show={show} onHide={onHide} centered>
      <Modal.Header closeButton>
        <Modal.Title>Logout</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <p>Are you sure you want to log out?</p>
      </Modal.Body>
      <Modal.Footer>
        <Button
          className="logout-modal-button cancel-button" // Apply cancel button styles
          onClick={onHide}
        >
          Cancel
        </Button>
        <Button
          className="logout-modal-button confirm-button" // Apply confirm button styles
          onClick={() => { onConfirm(); onHide(); }}
        >
          Logout
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default LogoutConfirmation;
