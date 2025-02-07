import React from "react";
import ReactDOM from "react-dom/client";

// React router library
import { BrowserRouter } from "react-router-dom";

import "./index.css";
import App from "./App";

// Bootstrap
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";

const link = document.createElement('link');
link.href = 'https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap';
link.rel = 'stylesheet';

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
