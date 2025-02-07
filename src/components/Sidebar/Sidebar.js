import React, { useState } from "react";
import { NavLink } from "react-router-dom";
import {
  FaTh,
  FaBars,
  FaUserAlt,
  FaRegChartBar,
  FaCommentAlt,
  FaShoppingBag,
  FaThList,
  RiDashboard3Fill ,
} from "react-icons/fa";

import "./Sidebar.css";


const Sidebar = () => {
  const [isOpen, setIsOpen] = useState(false);

  const toggle = () => setIsOpen(!isOpen);

  const menuItem = [
    {
      path: "/",
      name: "Dashboard",
      icon: <FaTh />,
    },
    {
      path: "/page1",
      name: "Page1",
      icon: <FaBars />,
    },
    {
      path: "/planningview",
      name: "Planningview",
      icon: < FaThList/>,
    },
  ];

  return (
    <div className={`sidebar ${isOpen ? "" : "collapsed"}`} > 
      <div className="top_section">
        <div className="bars" >
          <FaBars onClick={toggle} />
        </div>

        <p className="logo" style={{ display: isOpen ? "block" : "none" }}>
            <img src="/images/logo-bsc-global.png" alt="BSC Logo" className="img-fluid" />
        </p>

        <div
          className="container-fluid bottom_section"
          style={{ display: isOpen ? "block" : "none" }}
        >
          <hr />
        </div>
      </div>
      
      <div className="scrollable">
        {menuItem.map((item, index) => (
          <NavLink
            to={item.path}
            key={index}
            className="link"
            activeClassName="active"
          >
            <div className="icon">{item.icon}</div>
            <div
              className="link_text"
              style={{ display: isOpen ? "block" : "none" }}
            >
              {item.name}
            </div>
          </NavLink>
        ))}
      </div>
    </div>
  );
};

export default Sidebar;
