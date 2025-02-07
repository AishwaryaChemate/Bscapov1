import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./Login.css";
function Login({ onLogin }) {
  const [formData, setFormData] = useState({
    username: "",
    password: "",
  });

  const navigate = useNavigate(); // Hook to programmatically navigate

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const response = await fetch("http://localhost:5000/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });

    if (response.ok) {
      const data = await response.json();
      localStorage.setItem("token", data.access_token);
      onLogin();
      navigate("/dashboard"); // Navigate to the dashboard after login
    } else {
      alert("Invalid credentials");
    }
  };

  return (
    <div
      className="container-fluid"
      style={{
        background: "#eaeaea",
        minHeight: "100vh",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <div
        className="card"
        style={{
          width: "400px",
          padding: "30px",
          borderRadius: "10px",
          boxShadow: "0 4px 6px rgba(0,0,0,0.1)",
        }}
      >
        <div className="text-center mb-4">
          <img
            src="/images/logo-bsc-global.png"
            alt="BSCGLOBAL"
            style={{
              width: "300px",

              marginBottom: "20px",
            }}
            className="img-fluid"
          />
        </div>
        <h2
          className="text-center"
          style={{ color: " #F97316", marginBottom: "30px" }}
        >
          Welcome to BSC APO
        </h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <input
              type="text"
              className="form-control"
              placeholder="Email address"
              name="username"
              value={formData.username}
              onChange={handleChange}
              style={{
                borderRadius: "5px",
                padding: "10px",
                border: "1px solid rgba(0,0,0,0.1)",
                marginBottom: "15px",
              }}
            />
          </div>
          <div className="mb-3">
            <input
              type="password"
              className="form-control"
              placeholder="Password"
              name="password"
              value={formData.password}
              onChange={handleChange}
              style={{
                borderRadius: "5px",
                padding: "10px",
                border: "1px solid rgba(0,0,0,0.1)",
                marginBottom: "30px",
              }}
            />
          </div>
          <button
            type="submit"
            className="btn btn-primary w-100"
            style={{
              backgroundColor: "#F97316",
              border: "none",
              borderRadius: "5px",
              padding: "10px",
              fontWeight: "bold",
            }}
          >
            Login
          </button>
        </form>
        <p
          className="text-center mt-3"
          style={{ color: "#333", fontSize: "0.9rem" }}
        >
          <a
            href="#"
            style={{ color: "#F97316", textDecoration: "none" }}
          >
            Forgot Password?
          </a>
        </p>
      </div>
    </div>
  );
}

export default Login;
