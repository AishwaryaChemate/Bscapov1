import { useState, useEffect } from "react";

import "./App.css";
import Login from "./pages/Login/Login";
import Maincontent from "./pages/MainContent/Maincontent";

function App() {
  const [loggedIn, setLoggedIn] = useState(false);
  const [loading, setLoading] = useState(true);

  const handleLogin = () => {
    setLoggedIn(true);
  };

  const handleLogout = () => {
    setLoggedIn(false);
  };

  useEffect(() => {
    const token = localStorage.getItem("token");

    if (token) {
      fetch("http://localhost:5000/verify_token", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
        },
      })
        .then((response) => response.json())
        .then((data) => {
          console.log("Verification response:", data); // Debug statement
          if (data.valid) {
            setLoggedIn(true);
          } else {
            localStorage.removeItem("token");
            setLoggedIn(false);
          }
        })
        .catch((error) => {
          console.error("Error verifying token:", error);
          setLoggedIn(false);
        })
        .finally(() => {
          setLoading(false);
        });
    } else {
      setLoggedIn(false);
      setLoading(false);
    }
  }, []);

  if (loading) {
    return null; // Do not render anything while loading
  }
  return (
    <div>
      {loggedIn ? (
        <Maincontent onLogout={handleLogout} />
      ) : (
        <Login onLogin={handleLogin} />
      )}
    </div>
  );
}

export default App;

{
  /*

import React from "react";

function MyComponent() {
  // Add state or other logic here if needed
  // Example: const [state, setState] = React.useState(initialValue);

  return (
    <div className="my-component">
      
      <h1>Welcome to My Component!</h1>
    </div>
  );
}

export default MyComponent;

*/
}
