// ForecastClick.js
import React from 'react';
import { useLocation } from 'react-router-dom';
import './ForecastClick.css';

const ForecastClick = () => {
  const location = useLocation();
  const { row } = location.state || {};

  if (!row) {
    return <div>No data available</div>;
  }

  // Calculate monthly and weekly data
  const forecastData = parseFloat(row.forecast) || 0;
  const monthlyData = (forecastData / 12).toFixed(2);
  const weeklyData = (monthlyData / 4).toFixed(2);

  return (
    <div className="container">
      <h3>Forecast Details</h3>
      <h4>Monthly Data</h4>
      <table className="table-container-forecastClick">
        <thead>
          <tr>
            <th>Material</th>
            <th>Jan</th>
            <th>Feb</th>
            <th>Mar</th>
            <th>Apr</th>
            <th>May</th>
            <th>Jun</th>
            <th>Jul</th>
            <th>Aug</th>
            <th>Sep</th>
            <th>Oct</th>
            <th>Nov</th>
            <th>Dec</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>{row.material_code}</td>
            {Array.from({ length: 12 }).map((_, index) => (
              <td key={index}>{monthlyData}</td>
            ))}
          </tr>
        </tbody>
      </table>

      <h4>Weekly Data (Current Month)</h4>
      <table className="table-container-forecastClick">
        <thead>
          <tr>
            <th>Material</th>
            <th>W1</th>
            <th>W2</th>
            <th>W3</th>
            <th>W4</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>{row.material_code}</td>
            {Array.from({ length: 4 }).map((_, index) => (
              <td key={index}>{weeklyData}</td>
            ))}
          </tr>
        </tbody>
      </table>
    </div>
  );
};

export default ForecastClick;
