// submitConfirmationDialog.js
import React from 'react';

const SubmitConfirmationDialog = ({ show, handleClose, handleConfirm }) => {
  return (
    <div className={`modal fade ${show ? 'show' : ''}`} tabIndex="-1" role="dialog" style={{ display: show ? 'block' : 'none' }}>
      <div className="modal-dialog" role="document">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title">Confirmation</h5>
            {/* <button type="button" className="close" onClick={handleClose} aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button> */}
          </div>
          <div className="modal-body">
            Are you sure you want to proceed with this action?
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-secondary" onClick={() => handleConfirm(false)}>No</button>
            <button type="button" className="btn btn-primary" onClick={() => handleConfirm(true)}>Yes</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SubmitConfirmationDialog;
