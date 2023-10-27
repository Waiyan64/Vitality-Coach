import React, { useState } from "react";
import TraningImage from "../../assets/Traning.png";
import "./styles.css";
import { useNavigate } from "react-router-dom";
import { useStateValue } from "../../StateContext";

function Traning() {
  // define state for form data
  const [formData, setFormData] = useState({
    username: "",
    selectedAge: 18,
    yourGoal: 0,
    healthConditions: 0,
    timeAvailability: 1,
    dietaryPreferences: 0,
    eatingHabits: 1,
  });
  const [, dispatch] = useStateValue();

  const navigate = useNavigate();

  // add options for age
  const ageOptions = [];
  for (let age = 18; age <= 65; age++) {
    ageOptions.push(
      <option key={age} value={age}>
        {age}
      </option>
    );
  }

  // add options for goal
  const goalArray = [
    "None",
    "Lose Fat",
    "Gain Muscle",
    "Improve Overall Athletic Ability",
    "Improve Cardiovascular Conditioning",
    "General Wellbeing",
  ];
  const goalOptions = [];
  for (let i = 0; i <= 5; i++) {
    goalOptions.push(
      <option key={i} value={i}>
        {goalArray[i]}
      </option>
    );
  }

  // add options for Health Conditions
  const healthArray = [
    "None",
    "Asthma",
    "Heart Condition",
    "Acid Reflux (Heartburn)",
    "Joint Issues (Including Spine)",
    "Overweight",
    "Flat Feet",
  ];
  const healthOptions = [];
  for (let i = 0; i <= 6; i++) {
    healthOptions.push(
      <option key={i} value={i}>
        {healthArray[i]}
      </option>
    );
  }

  // add options for Time availability
  const timeOptions = [];
  for (let time = 1; time <= 5; time++) {
    timeOptions.push(
      <option key={time} value={time}>
        {time}
      </option>
    );
  }

  // add options for Health Conditions
  const dietaryPreferences = [
    "None",
    "Vegan",
    "Vegetarian",
    "Gluten-Intolerant",
    "Lactose-Intolerant",
    "Pescatarian",
    "No beef",
    "No pork",
  ];
  const dietOptions = [];
  for (let i = 0; i <= 7; i++) {
    dietOptions.push(
      <option key={i} value={i}>
        {dietaryPreferences[i]}
      </option>
    );
  }

  // add options for Meal Options
  const mealOptions = [];
  for (let meal = 1; meal <= 3; meal++) {
    mealOptions.push(
      <option key={meal} value={meal}>
        {meal}
      </option>
    );
  }

  // Handle form input changes for number fields
  const handleChangeNumber = (event) => {
    setFormData({
      ...formData,
      [event.target.name]: parseInt(event.target.value),
    });
  };

  // Handle form input changes for text fields
  const handleChangeText = (event) => {
    setFormData({ ...formData, [event.target.name]: event.target.value });
  };

  // get training plan from the database
  const getTrainingPlan = async () => {
    const trainingResponse = await fetch("/api/get-training-plan", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });

    return trainingResponse;
  };

  // get meal plan from the database
  const getMealPlan = async () => {
    const mealResponse = await fetch("/api/get-meal-plan", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });

    return mealResponse;
  };
  // Handle form submission
  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const trainingResponse = await getTrainingPlan();
      const mealResponse = await getMealPlan();
      dispatch({
        type: "SET_DATA",
        data: {
          trainingPlan: await trainingResponse.json(),
          mealPlan: await mealResponse.json(),
        },
      });
    } catch (error) {
      console.error("Error submitting form:", error);
    }

    navigate("/plan");
  };

  const handleSubmitTraining = async (e) => {
    // Handle form submission
    e.preventDefault();

    try {
      const trainingResponse = await getTrainingPlan();

      dispatch({
        type: "SET_DATA",
        data: { trainingPlan: await trainingResponse.json(), mealPlan: null },
      });
    } catch (error) {
      console.error("Error submitting form:", error);
    }

    navigate("/plan");
  };

  const handleSubmitDiet = async (e) => {
    // Handle form submission

    e.preventDefault();

    try {
      const mealResponse = await getMealPlan();
      dispatch({
        type: "SET_DATA",
        data: {
          trainingPlan: null,
          mealPlan: await mealResponse.json(),
        },
      });
    } catch (error) {
      console.error("Error submitting form:", error);
    }

    navigate("/plan");
  };

  return (
    <div className="traning-page">
      <header className="green-strip">
        <div>
          <h1>Training & Diet Plan</h1>
        </div>
        <div className="content">
          <img src={TraningImage} alt="Traning with weights" />
        </div>
      </header>
      <div className="formContent">
        <h2>Enter Your Details :</h2>

        <form className="traningForm" onSubmit={handleSubmit}>
          <div className="form-group">
            <div className="form-value">
              <label htmlFor="name">Name :</label>
              <input
                type="text"
                id="username"
                name="username"
                value={formData.username}
                onChange={handleChangeText}
                placeholder="Enter your name"
              />
            </div>

            <div className="form-value">
              <label htmlFor="age">Age :</label>
              <select
                name="selectedAge"
                value={formData.selectedAge}
                onChange={handleChangeNumber}
              >
                {ageOptions}
              </select>
            </div>

            <div className="form-value">
              <label htmlFor="goal">Your Goal :</label>
              <select
                name="yourGoal"
                value={formData.yourGoal}
                onChange={handleChangeText}
              >
                {goalOptions}
              </select>
            </div>

            <div className="form-value">
              <label htmlFor="health">Health Conditions:</label>
              <select
                name="healthConditions"
                value={formData.healthConditions}
                onChange={handleChangeText}
              >
                {healthOptions}
              </select>
            </div>

            <div className="form-value">
              <label htmlFor="weight">Time Availability:</label>
              <select
                name="timeAvailability"
                value={formData.timeAvailability}
                onChange={handleChangeNumber}
              >
                {timeOptions}
              </select>
              <p> &nbsp; &nbsp; training sessions per week</p>
            </div>

            <div className="form-value">
              <label htmlFor="weight">Dietary Preferences:</label>
              <select
                name="dietaryPreferences"
                value={formData.dietaryPreferences}
                onChange={handleChangeText}
              >
                {dietOptions}
              </select>
            </div>

            <div className="form-value">
              <label htmlFor="eatingHabits">Eating Habits:</label>
              <select
                name="eatingHabits"
                value={formData.eatingHabits}
                onChange={handleChangeNumber}
              >
                {mealOptions}
              </select>
              <p> &nbsp; &nbsp; no. of main meals per day</p>
            </div>
          </div>

          <div className="buttondiv">
            <button onClick={handleSubmitDiet} className="btn">
              Get Diet Plan Only
            </button>
            <button onClick={handleSubmit} className="btn">
              Get Training & Diet Plan
            </button>
            <button onClick={handleSubmitTraining} className="btn">
              Get Training Plan Only
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default Traning;
