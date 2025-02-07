import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';
import axios from 'axios';
import './PlanningViewSAP.css'; // Import your CSS file for custom styles

// Function to generate an array of week start dates (Mondays)
const generateWeekDates = (numWeeks) => {
  let dates = [];
  let startDate = new Date();
  startDate.setDate(startDate.getDate() - startDate.getDay() + 1); // Set to Monday of the current week
  for (let i = 0; i < numWeeks; i++) {
    dates.push(new Date(startDate));
    startDate.setDate(startDate.getDate() + 7); // Move to next Monday
  }
  return dates;
};

// Function to generate random sales order values
const generateSalesOrder = () => {
  return Math.floor(Math.random() * 500) + 100; // Generate random value between 100 and 500
};

const PlanningViewSAP = () => {
  const [weeks, setWeeks] = useState(4); // Default to 4 weeks
  const [weekDates, setWeekDates] = useState(generateWeekDates(4));
  const [tableData, setTableData] = useState([]);
  const [navigate, setNavigate] = useState(false);
  const [selectedRow, setSelectedRow] = useState(null);
  const [file, setFile] = useState(null);

  const handleUpdateWeeks = () => {
    setWeekDates(generateWeekDates(weeks));
  };

  const handlePlannerRun = () => {
    const updatedTableData = tableData.map(row => ({
      ...row,
      forecast: (row.qty * 1.15).toFixed(2), // Increase initial by 15% for forecast
      salesOrder: generateSalesOrder() // Generate random sales order values
    }));
    setTableData(updatedTableData);
    console.log("bscglobal",updatedTableData)
  };

  const handleForecastClick = (row) => {
    if (row.forecast) {
      setSelectedRow(row);
      setNavigate(true);
    }
  };

  const handleFileChange = (event) => {
    setFile(event.target.files[0]);
  };

  const handleFileUpload = () => {
    if (!file) {
      alert('Please select a file first.');
      return;
    }
 
    const formData = new FormData();
    formData.append('file', file);
 
    axios.post('http://localhost:5000/uploadfile', formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    })
    .then(response => {
      alert('File uploaded successfully!');
      // Handle the response data if needed
    })
    .catch(error => {
      console.error('There was an error uploading the file!', error);
      alert('File upload failed. Please try again.');
    });
  };

  useEffect(() => {
    // Function to fetch data from the backend
    const fetchData = async () => {
      try {
        const response = await axios.get('http://localhost:5000/getdata');
        console.log("fetchData",response.data); // Log the response to check validity

        if (response.data && Array.isArray(response.data)) {
          setTableData(response.data);
        } else {
          console.error('Invalid response format');
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []);

  if (navigate) {
    return <Navigate to="/forecast-details" state={{ row: selectedRow }} />;
  }

  return (
    <div className="container planning-view-sap">
      <div className="row mb-3">
        <div className="col-12 d-flex justify-content-between align-items-center">
          <div className="d-flex align-items-center">
            <div className=" me-2 ">
              
              <input className="form-control" type="file" id="formFile" onChange={handleFileChange} />
            </div>
            <button onClick={handleFileUpload} className="btn-planningViewSap">Upload File</button>
            <button onClick={handlePlannerRun} className="btn-planningViewSap" id='planner-run'>Planner Run</button>
          </div>
          <div className="d-flex justify-content-end align-items-center">
            <input
              type="number"
              value={weeks}
              onChange={(e) => setWeeks(parseInt(e.target.value) || "")}
              min="0"
              className="form-control me-2 input-sm"
              style={{ width: '100px' }} // Adjusting the width here
            />
            <button onClick={handleUpdateWeeks} className="btn-planningViewSap">Update Weeks</button>
          </div>
        </div>
      </div>
      <div className="row">
        <div className="col-12">
          <div className="table-responsive-custom"> {/* Custom container for the table */}
            <table className="table-container-sap">
              <thead>
                <tr>
                  <th>Material</th>
                  <th>UOM</th>
                  <th>Initial</th>
                  <th>Forecast</th>
                  <th>Sales Order</th>
                  <th>STR Demand</th>
                  <th>STO Demand</th>
                  <th>Total Demand</th>
                  {/* {weekDates.map((date, index) => (
                    <th key={index}>{date.toLocaleDateString()}</th>
                  ))} */}
                </tr>
              </thead>
              <tbody>
                {tableData.map((row, rowIndex) => (
                  <tr key={rowIndex}>
                    <td>{row.material_code}</td>
                    <td>{row.uom}</td>
                    <td>{row.qty}</td>
                    <td 
                      onClick={() => handleForecastClick(row)} 
                      style={{ cursor: 'pointer', color: ' #F97316' }}
                    >
                      {row.forecast}
                    </td>
                    <td>{row.salesOrder}</td>
                    <td>{row.strDemand}</td>
                    <td>{row.stoDemand}</td>
                    <td>{row.totalDemand}</td>
                    {/* {weekDates.map((date, colIndex) => (
                      <td key={colIndex}></td>
                    ))} */}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default PlanningViewSAP;
