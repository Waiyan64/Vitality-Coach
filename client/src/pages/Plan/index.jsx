import React from "react";
import './styles.css';
import TutorialPhoto from '../../assets/TutorialPhoto.png';

import { useStateValue } from "../../StateContext";

function Plan() {
  const [{ data }] = useStateValue();

  const traningPlan = data?.trainingPlan;
  const mealPlan = data?.mealPlan;

  return (
    <div style={{ padding: "110px" }}>
      <header className="green-strip">
        <div>
          <h1>Training & Diet Plan</h1>
        </div>
        <div className="content">
          <img src={TutorialPhoto} alt="Traning with weights" />
        </div>
      </header>
      {!!traningPlan && (
        <>
          <h1 className="planHeader">Training Plan</h1>
          <h2>Here are the exercises suitable for you-</h2>
          <div>
            {traningPlan.map((plan) => (
              <div key={plan.id}>
                <h3>{plan.name}</h3>
                <ul>
                <li>{plan.instructions}</li>
                <li><a className="planLink"href={plan.video_link}  target="_blank">Watch example Video</a>  </li>              
                </ul>
              </div>
            ))}
          </div>
          <h3>Week 1: </h3>
          <ul>
            <li> Day 1: Full-body strength training (All exercises that are metioned) </li>
            <li>Day 2: Cardiovascular exercise (e.g., jogging, cycling, swimming) </li>
            <li> Day 3: Rest day</li>
            <li>Day 4: Upper body strength training (e.g. Exercises with caregories- Arm, Chest, Back)</li>
            <li>Day 5: Lower body strength training (e.g., Exercises with caregories- Leg)</li>
            <li>Day 6: Cardiovascular exercise and core workout (e.g., running, planks, Russian twists)</li>
            <li>Day 7: Rest day</li>
          </ul>
          <h3>Week 2: </h3>
          <ul>
            <li>Repeat the Week 1 workout routine, but aim to increase the intensity or weights used for strength exercises.</li>
          </ul>
          <h3>Week 3: </h3>
          <ul>
            <li>Introduce new exercises or variations to challenge your muscles and prevent plateaus.</li>
            <li>Include a mix of strength training, cardiovascular exercise, and flexibility exercises like yoga or stretching.</li>
          </ul>
          <h3>Week 4: </h3>
          <ul>
            <li>Incorporate high-intensity interval training (HIIT) workouts for an extra calorie burn and cardiovascular challenge.</li>
            <li>Focus on maintaining proper form and gradually increasing weights or intensity as your fitness improves.</li>
          </ul>
          <h3>Throughout the 30-day plan: </h3>
          <ul>
            <li>Include at least 150 minutes of moderate-intensity aerobic exercise or 75 minutes of vigorous-intensity aerobic exercise per week. </li>
            <li>Incorporate strength training exercises at least twice a week, targeting major muscle groups.</li>
            <li>Remember to warm up before each workout and cool down afterward to prevent injuries and aid in recovery.</li>
            <li>Listen to your body and adjust the plan accordingly if you experience any discomfort or excessive fatigue.</li>
          </ul>
        </>
      )}
      {!!mealPlan && (
        <>
          <h1 className="planHeader">Diet Plan</h1>
          <h2>Here are the Meals you can try-</h2>
          <div>
            {mealPlan.map((plan) => (
              <div key={plan.id}>
                <h3>{plan.name}</h3>
                <ul>
                <li>{plan.instructions}</li>
                <li><a className="planLink"href={plan.video_link}  target="_blank">Watch example Video</a>  </li>              
                </ul>
              </div>
            ))}
          </div>
          <h3>Week 1: </h3>
          <ul>
            <li> Day 1: 
               <ul>
                <li>Breakfast: Choose a casual one. For example, Oatmeal with berries and a side of Greek yogurt.</li>
                <li>Lunch: Choose one with high protein. For example, Grilled chicken salad with mixed greens, vegetables, and a light vinaigrette dressing.</li>
                <li>Snack: Fresh fruit.</li>
                <li>Dinner: Choose one with high protein. For example, Baked salmon with quinoa and steamed vegetables.</li>
               </ul>
               </li>
            <li>Day 2: 
              <ul>
                <li>Repeat the pattern of a balanced breakfast, lunch, snack, and dinner.</li>
              </ul> 
            </li>
            <li> Day 3 to 7: 
              <ul>
                <li>Continue with a variety of healthy meals and snacks that include lean proteins, whole grains, fruits, vegetables, and healthy fats.</li>
              </ul>
            </li>
          </ul>
          <h3>Week 2 to Week 4: </h3>
          <ul>
            <li>Repeat the pattern of Week 1, ensuring a balance of macronutrients (carbohydrates, proteins, and fats) and micronutrients (vitamins and minerals) throughout the day.</li>
            <li>Incorporate a variety of proteins such as lean meats, fish, legumes, tofu, and eggs.</li>
            <li>Include a mix of complex carbohydrates like whole grains, fruits, and vegetables.</li>
            <li>Incorporate healthy fats from sources like avocados, nuts, seeds, and olive oil.</li>
            <li>Drink plenty of water throughout the day to stay hydrated.</li>
            <li>Consider portion sizes and listen to your body's hunger and fullness cues.</li>
          </ul>
          <h3>Additional Tips: </h3>
          <ul>
            <li>Aim for three balanced meals and two nutritious snacks each day to maintain energy levels and support overall health. </li>
            <li>Include a variety of colorful fruits and vegetables to maximize nutrient intake. </li>
            <li>Prioritize lean proteins and high-fiber foods to promote satiety. </li>
            <li>Limit added sugars, processed foods, and unhealthy fats. </li>
            <li>Monitor your progress and adjust the plan as needed based on your individual goals and preferences. </li>

          </ul>

        </>
      )}
    </div>
  );
}

export default Plan;
