import React, { useState, useEffect, useCallback } from "react";
import "./PlanningView.css";
import axios from "axios";
import SubmitConfirmationDialog from '../ConfirmationDialog/SubmitConfirmationDialog';

function PlanningView() {
  //added 14-01
  const [plantName, setPlantName] = useState([]);
  const [selectedPlantCode, setSelectedPlantCode] = useState('');
  const [selectedProductCode, setSelectedProductCode] = useState('');

  const fetchplantData = async () => {
    try {
      const response = await fetch("http://localhost:5000/plantnameList");
      const data = await response.json();
      console.log('here is plant data:', data);
      setPlantName(data);
    } catch (error) {
      console.log(error);
    }
  };
  useEffect(() => {
    fetchplantData();
  }, []);

  const handlePlantChange = (e) => {
    setSelectedPlantCode(e.target.value);
    console.log("Selected Plant Code:", e.target.value);

  };

  const handleProductChange = (e) => {
    setSelectedProductCode(e.target.value);
  };
  //till here

  const [data, setData] = useState({
    forecast: [],
    sales_order: [],
    str_demand: [],
    sto_demand: [],
    str_receipt: [],
    sto_receipt: [],
    planned_order: [],
    production_order: [],
    stock: [],
    daysSupply: [], // Added Days Supply key figure
    projectedBalance: [], // Added Projected Balance key figure


  });

  const [weeks, setWeeks] = useState(4); // Initial number of weeks
  const [newWeeks, setNewWeeks] = useState(""); // Input for the number of weeks
  //const [plantName, setPlantName] = useState([]);
  const [initialSums, setInitialSums] = useState({});
  // const [currentDate, setCurrentDate] = useState(getCurrentDate());

  /*
    const handleChange = (category, weekIndex, value) => {
      const newData = { ...data };
      newData[category][weekIndex] = Number(value);
      setData(newData);
    };
  */

  const handleChange = (category, weekIndex, value) => {
    const newData = { ...data };
    // Ensure newData[category] is an array
    if (!newData[category]) {
      newData[category] = [];
    }
    newData[category][weekIndex] = Number(value);
    setData(newData);
  };



  const updateWeeks = () => {
    const weekCount = parseInt(newWeeks, 10);
    if (isNaN(weekCount) || weekCount <= 0) {
      alert("Please enter a valid number greater than 0.");
      return;
    }
    setWeeks(weekCount);

    // Adjust the data arrays to match the new week count
    const newData = { ...data };
    Object.keys(newData).forEach((key) => {
      if (newData[key].length > weekCount) {
        // Truncate the array if weeks are reduced
        newData[key] = newData[key].slice(0, weekCount);
      } else {
        // Add zeros if weeks are increased
        while (newData[key].length < weekCount) {
          newData[key].push(0);
        }
      }
    });
    setData(newData);
    setNewWeeks(""); // Reset the input field
  };

  const calculateTotalDemandForWeek = (weekIndex) => {
    return (
      (data.forecast[weekIndex] || 0) +
      (data.sales_order[weekIndex] || 0) +
      (data.str_demand[weekIndex] || 0) +
      (data.sto_demand[weekIndex] || 0)
    );
  };

  /*
    const calculateTotalReceiptForWeek = (weekIndex) => {
      return (
        (data.sto_receipt[weekIndex] || 0) +
        (data.stoReceipt[weekIndex] || 0) +
        (data.planned_order[weekIndex] || 0) +
        (data.production_order[weekIndex] || 0) +
         (data.stock[weekIndex] || 0)
      );
    };
   */

  const calculateTotalReceiptForWeek = (weekIndex) => {
    return (
      (data.str_receipt[weekIndex] || 0) +
      (data.sto_receipt[weekIndex] || 0) +
      (data.planned_order[weekIndex] || 0) +
      (data.production_order[weekIndex] || 0)

    );
  };

  const fetchData = async (plant, product) => {
    alert(plant);
    alert(product);
    try {
      const response = await axios.get('http://localhost:5000/previous-data-sum', {
        params: { plant_code: plant, product_code: product }
      });
      console.log("Initial Sum", response.data);
      setInitialSums(response.data); // Store the initial data
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  
  const calculateProjectedBalance = useCallback((returnTotals = false) => {
    const newProjectedBalance = [];
    const initialBalance = initialSums.projected_balance ? parseFloat(initialSums.projected_balance) : 0; // Use initial projected balance
    let previousBalance = initialBalance;
    const newTotalDemand = [];
    const newTotalReceipt = [];

    for (let i = 0; i < weeks; i++) {
      const totalDemand = calculateTotalDemandForWeek(i);
      const totalReceipt = calculateTotalReceiptForWeek(i);

      newTotalDemand.push(totalDemand);
      newTotalReceipt.push(totalReceipt);

      if (i === 0) {
        newProjectedBalance.push(initialBalance + totalReceipt - totalDemand);
      } else {
        newProjectedBalance.push(previousBalance + totalReceipt - totalDemand);
      }

      previousBalance = newProjectedBalance[i];
    }

    if (returnTotals) {
      return { totalDemand: newTotalDemand, totalReceipt: newTotalReceipt };
    } else {
      return { projectedBalance: newProjectedBalance, totalDemand: newTotalDemand, totalReceipt: newTotalReceipt };
    }
  }, [weeks, data, initialSums]);

  const updateProjectedBalance = useCallback(() => {
    setData(prevData => {
      const { projectedBalance, totalDemand, totalReceipt } = calculateProjectedBalance();
      if (JSON.stringify(prevData.projectedBalance) !== JSON.stringify(projectedBalance)) {
        return { ...prevData, projectedBalance, totalDemand, totalReceipt };
      } else {
        return prevData;
      }
    });
  }, [calculateProjectedBalance]);
/*
  useEffect(() => {
    if (selectedPlantCode && selectedProductCode) {
      fetchData(selectedPlantCode, selectedProductCode);
    }
  }, [selectedPlantCode, selectedProductCode]);
*/
  useEffect(() => {
    updateProjectedBalance();
  }, [weeks, data, updateProjectedBalance, initialSums]);



  /* added by kailas
  const calculateProjectedBalance = useCallback((returnTotals = false) => {
    const newProjectedBalance = [];
    let previousBalance = 0;
    const newTotalDemand = [];
    const newTotalReceipt = [];
  
    for (let i = 0; i < weeks; i++) {
      const totalDemand = calculateTotalDemandForWeek(i);
      const totalReceipt = calculateTotalReceiptForWeek(i);
  
      newTotalDemand.push(totalDemand);
      newTotalReceipt.push(totalReceipt);
  
      if (i === 0) {
        newProjectedBalance.push(totalReceipt - totalDemand);
      } else {
        newProjectedBalance.push(previousBalance + totalReceipt - totalDemand);
      }
  
      previousBalance = newProjectedBalance[i];
    }
  
    if (returnTotals) {
      return { totalDemand: newTotalDemand, totalReceipt: newTotalReceipt };
    } else {
      return { projectedBalance: newProjectedBalance, totalDemand: newTotalDemand, totalReceipt: newTotalReceipt };
    }
  }, [weeks, data]);
  
  
  const updateProjectedBalance = useCallback(() => {
    setData(prevData => {
      const { projectedBalance, totalDemand, totalReceipt } = calculateProjectedBalance();
      if (JSON.stringify(prevData.projectedBalance) !== JSON.stringify(projectedBalance)) {
        return { ...prevData, projectedBalance, totalDemand, totalReceipt };
      } else {
        return prevData;
      }
    });
  }, [calculateProjectedBalance]);
  
  useEffect(() => {
    updateProjectedBalance();
  }, [weeks, data, updateProjectedBalance]);
  */

  const getCurrentDate = (daysToAdd = 0) => {
    const now = new Date();
    now.setDate(now.getDate() + daysToAdd);
    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0'); // Month is zero-based 
    const year = now.getFullYear();
    return `${day}-${month}-${year}`;
  };

  const dates = [...Array(weeks)].map((_, weekIndex) => getCurrentDate(weekIndex * 7));




  const handleSubmit = async () => {
    alert(selectedPlantCode);
    alert(selectedProductCode);
    if (!selectedPlantCode || !selectedProductCode) {
      console.error('Plant code or product code is missing.');
      return;
    }

    const dates = [...Array(weeks)].map((_, weekIndex) => getWeekEndDate(weekIndex * 7));

    console.log("Dates array:", dates);

    // Use the updated state values for totalDemand and totalReceipt
    const { totalDemand, totalReceipt } = data;

    const payload = {
      data,
      dates,
      totalDemand,
      totalReceipt,
    };

    console.log("submitted data", payload);

    try {
      const response = await axios.post(`http://localhost:5000/submitdata?plantCode=${selectedPlantCode}&productCode=${selectedProductCode}`, payload);
      console.log("data submitted successfully");
    } catch (error) {
      console.log(error);
    }
  };





  /* added by kailas 
  const [initialSums, setInitialSums] = useState({});
    const [currentDate, setCurrentDate] = useState(getCurrentDate());
  
  useEffect(() => {
    if (selectedPlantCode && selectedProductCode) {
        fetchData(selectedPlantCode, selectedProductCode);
    }
  }, [currentDate, selectedPlantCode, selectedProductCode]);
  
  const fetchData = async (plant, product) => {
    alert(plant);
    alert(product);
    try {
        const response = await axios.get('http://localhost:5000/previous-data-sum', {
            params: { plant_code: plant, product_code: product }
        });
        console.log("Initial Sum",response.data);
        setInitialSums(response.data);
    } catch (error) {
        console.error('Error fetching data:', error);
    }
  };
  */
  //it is used for column
  const getWeekStartDate = (daysToAdd = 0) => {
    const now = new Date();
    // Calculate the number of days to go back to the previous Monday
    const dayOfWeek = now.getDay(); // Sunday = 0, Monday = 1, ..., Saturday = 6
    const daysToMonday = (dayOfWeek + 6) % 7; // Calculate days since Monday (0-6)
    now.setDate(now.getDate() + daysToAdd - daysToMonday); // Adjust date to the Monday of the week
    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0'); // Month is zero-based
    const year = now.getFullYear();
    return `${day}-${month}-${year}`;
  };


  const getWeekEndDate = (daysToAdd = 0) => {
    const now = new Date();
    const dayOfWeek = now.getDay();
    const daysToFriday = (5 - dayOfWeek + 7) % 7;
    now.setDate(now.getDate() + daysToAdd + daysToFriday);
    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const year = now.getFullYear();
    return `${day}-${month}-${year}`;
  }

  // Example usage
  //console.log(getWeekEndDate()); // This will print the upcoming Friday's date
  const [existingData, setExistingData] = useState({});
  /*
  useEffect( () => {
    if(selectedPlantCode && selectedProductCode){
      fetchExistingData(selectedPlantCode,selectedProductCode);
    }
  },[selectedPlantCode,selectedProductCode]);
  */




  const fetchExistingData = async (plantCode, productCode) => {
    const dates = [...Array(weeks)].map((_, weekIndex) => getWeekEndDate(weekIndex * 7));
    try {
      const response = await axios.get("http://localhost:5000/fetchExistingData", {
        params: { plant_code: plantCode, product_code: productCode, dates: JSON.stringify(dates) },
      });
      setExistingData(response.data || {});
    } catch (error) {
      console.error(error);
    }
  };


/*
  useEffect(() => {
    if (selectedPlantCode && selectedProductCode) {
      fetchExistingData(selectedPlantCode, selectedProductCode);
    }
  }, [selectedPlantCode, selectedProductCode]);
*/
  useEffect(() => {
    if (existingData) {
      setData((prevData) => {
        const updatedData = { ...prevData };
        // Dynamically update all fields if existinData contains them
        Object.keys(prevData).forEach((key) => {
          if (existingData[key]) {
            updatedData[key] = existingData[key];
          }
        });
        return updatedData;
      });
    }
  }, [existingData]);


  const handleClick = async () => {
    fetchExistingData(selectedPlantCode,selectedProductCode);
    await fetchData(selectedPlantCode, selectedProductCode);
    updateWeeks();
  };



  const[showSubmitDialog,setShowSubmitDialog]= useState(false);
  const[activeAction,setActiveAction]= useState(null);

  const handleShow = () => setShowSubmitDialog(true);
  const handleClose =() => setShowSubmitDialog(false);

  const handleConfirm = (isConfirmed) => {
    setShowSubmitDialog(false);
    if (isConfirmed) {
      // Add your confirmation logic here
      console.log('Action confirmed!');
      handleSubmit();
    } else {
      console.log('Action canceled!');
      // Handle cancellation logic here, if any
    }
  };

/*
const handleConfirm = async (isConfirmed) => {
  setShowSubmitDialog(false);
  if (isConfirmed) {
    if (activeAction === 'update_week') {
      await handleClick();
    } else if (activeAction === 'submit') {
      handleSubmit();
    }
  } else {
    console.log('Action canceled!');
  }
};
*/

/*
const handlePlannerRun = async () => {
  alert(selectedPlantCode);
  alert(selectedProductCode);
  try {
    const response = await axios.get("http://localhost:5000/plannerrun", {
      params: { selectedPlantCode, selectedProductCode }
    });
    console.log(response.data); // Optional: Log the response data
    const manufacturingType = response.data.manufacturing_type;
    if(manufacturingType === "External"){
      const updatedData = {...existingData};
      console.log(updatedData);
      updatedData.str_receipt = updatedData.projected_balance;
      console.log("str_receipt fr",updatedData.str_receipt);

    }
  } catch (error) {
    console.log(error);
  }
};
*/


const handlePlannerRun = async () => {
  alert(selectedPlantCode);
  alert(selectedProductCode);
  try {
      const response = await axios.get("http://localhost:5000/plannerrun", {
          params: { selectedPlantCode, selectedProductCode }
      });
      console.log(response.data); // Optional: Log the response data
      const manufacturingType = response.data.manufacturing_type;
      if (manufacturingType === "External") {
          const updatedData = { ...existingData };
          console.log(updatedData);
          updatedData.str_receipt = updatedData.projected_balance;
          console.log("str_receipt fr", updatedData.str_receipt);

          // Update the data state with the new str_receipt values
          setData((prevData) => ({
              ...prevData,
              str_receipt: updatedData.str_receipt,
          }));
      }
  } catch (error) {
      console.log(error);
  }
};




  return (
    <div className="container">
      <div className="form-container-input-fields-planningview">
      
        <select className="dropdown-select" onChange={handlePlantChange} >
          <option value="">Select a Plant</option>
          {plantName.map(plant =>
          (<option key={`${plant.plant_code}-${plant.product_code}`}
            value={plant.plant_code}> {plant.plant_code}
          </option>))}
        </select>
      
        
        <select className="dropdown-select" onChange={handleProductChange} > 
          <option value="">Select a Product code</option>
          {plantName.map(product =>
          (<option key={`${product.plant_code}-${product.product_code}`}
            value={product.product_code}> {product.product_code}
          </option>
          ))}
        </select>
     

        <div>
              {/* <button
          type="button"
          className="btn btn-success"
          onClick={handleClick}
        >
          Update
        </button> */}
        {/* <button type="button" className="btn btn-success" onClick={() => handleShow('update')}>
        Update
        </button> */}
        </div>

        <div className="input-group">
          <input
            type="number"
            value={newWeeks}
            onChange={(e) => setNewWeeks(e.target.value)}
            placeholder="Enter the total number of weeks..."
            className="form-control"
          />
          <button
            type="button"
          // onClick={updateWeeks}
          onClick={() => handleClick()}
          >
            Update Weeks
          </button>
        </div>
      </div>

      
      <div className="buttons">
        {/* <button type="button" className="btn btn-secondary position-absolute" onClick={handleSubmit} style={{ right: 0 }}>
          Submit
        </button> */}
        
        {/* <button type="button" className="btn btn-secondary position-absolute" onClick={ handleConfirm}
          
          style={{right:0}}>
            Submit
        </button> */}
        <button type="button" className="primary-button" onClick={handlePlannerRun} >Planner Run</button>

        <button type="button" className="primary-button" onClick={handleShow} >
          Submit
        </button>
      </div>
      
    
    <div>
    <SubmitConfirmationDialog
        show={showSubmitDialog}
        handleClose={handleClose}
        handleConfirm={handleConfirm}
      />

      {showSubmitDialog && <div className="modal-backdrop fade show"></div>}
    </div>
      <div className="table-container">
        <table className="responsive-table">
          <thead>
            <tr>
              <th>Key Figure</th>
              <th>UOM</th>
              <th>Initial</th>
              {[...Array(weeks)].map((_, weekIndex) => (
                <th key={weekIndex}>{getWeekStartDate(weekIndex * 7)}</th>))}
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Forecast</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.forecast}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  <input
                    type="number"
                    //defaultValue={existinData.forecast[weekIndex]}
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("forecast", weekIndex, e.target.value)
                    }
                    //value={data.forecast[weekIndex] || ""}
                    value={data.forecast[weekIndex] || existingData.forecast?.[weekIndex] || ""}

                  />
                </td>
              ))}
            </tr>
            <tr>
              <td>Sales Order</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.sales_order}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("sales_order", weekIndex, e.target.value)
                    }
                    value={data.sales_order[weekIndex] || ""}
                  // value={(data.salesOrder?.[weekIndex] || existingData.sales_order?.[weekIndex] || "")}
                  />
                </td>
              ))}
            </tr>
            <tr>
              <td>STR Demand</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.str_demand}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  {/* <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("str_demand", weekIndex, e.target.value)
                    }
                    value={data.str_demand[weekIndex] || ""}
                  /> */}
                  <div>
                    {data.str_demand[weekIndex] ||""}
                  </div>
                </td>
              ))}
            </tr>
            <tr>
              <td>STO Demand</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.sto_demand}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  {/* <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("sto_demand", weekIndex, e.target.value)
                    }
                    value={data.sto_demand[weekIndex] || ""}
                  /> */}
                  <div>
                    {data.sto_demand[weekIndex] || ""}
                  </div>
                </td>
              ))}
            </tr>
            <tr>
              <td style={{ fontWeight:"550",color:" #F97316" }}>Total Demand</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.total_demand}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  {calculateTotalDemandForWeek(weekIndex)}
                </td>
              ))}
            </tr>
            <tr>
              <td>STR Receipt</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.str_receipt}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  {/* <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("str_receipt", weekIndex, e.target.value)
                    }
                    value={data.str_receipt[weekIndex] || ""}
                  /> */}
                  <div>
                    {data.str_receipt[weekIndex]||""}
                  </div>
                </td>
              ))}
            </tr>
            {/* <tr>
              <td>STO Receipt</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.sto_receipt}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("sto_receipt", weekIndex, e.target.value)
                    }
                    value={data.sto_receipt[weekIndex] || ""}
                  />
                </td>
              ))}
            </tr> */}
            <tr>
              <td>STO Receipt</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.sto_receipt}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  <div>
                    {data.sto_receipt[weekIndex] || ""}
                  </div>
                </td>
              ))}
            </tr>

            <tr>
              <td>Planned Order</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.planned_order}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("planned_order", weekIndex, e.target.value)
                    }
                    value={data.planned_order[weekIndex] || ""}
                  />
                </td>
              ))}
            </tr>
            <tr>
              <td>Production Order</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.production_order}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  {/* <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("production_order", weekIndex, e.target.value)
                    }
                    value={data.production_order[weekIndex] || ""}
                  /> */}
                  <div>
                    {data.production_order[weekIndex] ||""}
                  </div>
                </td>
              ))}
            </tr>
            <tr>
              <td>Stock</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.stock}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                // <td key={weekIndex}>
                //   <input
                //     type="number"
                //     placeholder="Enter Value"
                //     onChange={(e) =>
                //       handleChange("stock", weekIndex, e.target.value)
                //     }
                //     value={data.stock[weekIndex] || ""}
                //   />
                // </td>
                <td key={weekIndex} style={{ backgroundColor: "#D3D3D3" }}> <span>{data.stock[weekIndex] || ""}</span> </td>
              ))}
            </tr>
            <tr>
              <td style={{ fontWeight:"550",color:" #F97316" }}>Total Receipt</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.total_receipt}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  {calculateTotalReceiptForWeek(weekIndex)}
                </td>
              ))}
            </tr>
            {/*
            <tr>
              <td>Days Supply</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.days_supply}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  <input
                    type="number"
                    placeholder="Enter Value"
                    onChange={(e) =>
                      handleChange("daysSupply", weekIndex, e.target.value)
                    }
                    value={data.daysSupply[weekIndex] || ""}
                  />
                </td>
              ))}
            </tr>
            */}
            <tr>
              <td>Days Supply</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.days_supply}</td>
              {[...Array(weeks)].map((_, weekIndex) => {
                const totalDemand = data.totalDemand ? data.totalDemand[weekIndex] || 0 : 0; // Check if totalDemand array exists and get value
                const projectedBalance = weekIndex === 0
                  ? parseFloat(initialSums.projected_balance) // Use initial projected balance for the first week
                  : data.projectedBalance ? data.projectedBalance[weekIndex - 1] || 0 : 0; // Check if projectedBalance array exists and get value
                const daysSupply = totalDemand / 7; // Calculate days supply
                const finalValue = daysSupply !== 0 ? projectedBalance / daysSupply : 0; // Avoid division by zero

                const roundedValue = Math.round(finalValue); // Round to the nearest whole number

                return (
                  <td key={weekIndex}>
                    {isNaN(roundedValue) ? "N/A" : roundedValue} {/* Display rounded value */}
                  </td>
                );
              })}
            </tr>



            <tr>
              <td>Projected Balance</td>
              <td>{plantName[0]?.base_uom || "Base UOM"}</td>
              <td>{initialSums.projected_balance}</td>
              {[...Array(weeks)].map((_, weekIndex) => (
                <td key={weekIndex}>
                  {data.projectedBalance[weekIndex] || ""}
                </td>
              ))}
            </tr>
          </tbody>
        </table>
      </div>

      </div>
    
  );
}

export default PlanningView;
