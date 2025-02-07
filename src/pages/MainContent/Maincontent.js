import { Routes, Route, Navigate, useNavigate } from "react-router-dom";
import { useState } from "react";
import Sidebar from "../../components/Sidebar/Sidebar";
import Dashboard from "../Dashboard/Dashboard";
import Page1 from "../Page1/Page1";
import "./Maincontent.css";
import LogoutConfirmation from "../../components/ConfirmationDialog/LogoutConfirmation";
import ForecastClick from "../Page1/ForecastClick"
import PlanningViewSap from "../../components/PlanningViewWithSap/PlanningViewSap";

function Maincontent({ onLogout }) {

  const [showModal, setShowModal] = useState(false); // State to control modal visibility
  const navigate = useNavigate(); // Hook to programmatically navigate

const handleShowModal = () => {
  setShowModal(true);
};

// Function to hide the modal
const handleCloseModal = () => {
  setShowModal(false);
};

// Function to confirm logout
const handleConfirmLogout = async () => {
  try {
    const response = await fetch("http://localhost:5000/logout", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`, // Attach the access token
        "Content-Type": "application/json",
      },
    });

    if (response.ok) {
      // Clear the access token from local storage
      localStorage.removeItem("token");
      // Trigger the logout function passed from the parent component
      onLogout();
      navigate("/login"); // Navigate to login page after logout
    } else {
      // Handle logout failure
      console.error("Logout failed");
    }
  } catch (error) {
    console.error("Error occurred during logout:", error);
  }
};


  return (
    <div className="main_container">
      <Sidebar />
      <main>
        <div className="mb-2">
          {/*  <button
            type="button"
            className="logout_button"
            onClick={handleLogout}
          >
            Logout
          </button> */}
          <nav className="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="index.html" className="navbar-brand d-flex d-lg-none me-4">
              <h2 className="text-primary mb-0">
                <i className="fa fa-hashtag"></i>
              </h2>
            </a>
            <a href="#" className="sidebar-toggler flex-shrink-0">
              <i className="fa fa-bars"></i>
            </a>
            <form className="d-none d-md-flex ms-4">
              <input
                className="form-control"
                type="search"
                placeholder="Search"
              />
            </form>

            <div className="navbar-nav align-items-center ms-auto" >
              <div className="nav-item dropdown">
                <a
                  href="#"
                  className="nav-link dropdown-toggle"
                  data-bs-toggle="dropdown"
                >
                  <i className="fa fa-envelope me-lg-2"></i>
                  <span className="d-none d-lg-inline-flex">Message</span>
                </a>
                <div className="dropdown-menu dropdown-menu-end">
                  <a href="#" className="dropdown-item">
                    <div className="d-flex align-items-center">
                      <div className="ms-2">
                        <h6 className="fw-normal mb-0">
                          Jhon send you a message
                        </h6>
                        <small>15 minutes ago</small>
                      </div>
                    </div>
                  </a>
                  <hr className="dropdown-divider" />
                  <a href="#" className="dropdown-item text-center">
                    See all message
                  </a>
                </div>
              </div>
              <div className="nav-item dropdown">
                <a
                  href="#"
                  className="nav-link dropdown-toggle"
                  data-bs-toggle="dropdown"
                >
                  <span className="d-none d-lg-inline-flex">Notification</span>
                </a>
                <div className="dropdown-menu dropdown-menu-end">
                  <a href="#" className="dropdown-item">
                    <h6 >Profile updated</h6>
                    <small>15 minutes ago</small>
                  </a>
                  <hr className="dropdown-divider" />
                  <a href="#" className="dropdown-item">
                    See all notifications
                  </a>
                </div>
              </div>
              <div className="nav-item dropdown">
                <a
                  href="#"
                  className="nav-link dropdown-toggle"
                  data-bs-toggle="dropdown"
                >
                  <span className="d-none d-lg-inline-flex">Admin</span>
                </a>
                <div className="dropdown-menu dropdown-menu-end ">
                  <a href="#" className="dropdown-item">
                    My Profile
                  </a>
                  <a href="#" className="dropdown-item">
                    Settings
                  </a>
                  {/* <a href="#" className="dropdown-item" onClick={handleLogout}> */}
                  <a href="#" className="dropdown-item" onClick={handleShowModal}>
                    Log Out
                  </a>
                </div>
              </div>
            </div>
          </nav>
        </div>
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/page1" element={<Page1 />} />
          <Route path="/planningview" element={<PlanningViewSap/>} />
          <Route path="/forecast-details" element={<ForecastClick/>}/>
          

          {!localStorage.getItem("token") && <Navigate to="/login" />}
        </Routes>
        <LogoutConfirmation
        show={showModal}
        onHide={handleCloseModal}
        onConfirm={handleConfirmLogout}
      />
      </main>
    </div>
  );
}

export default Maincontent;
