import React from "react";
import HeaderImage from "../../assets/homePage.png";
import Rectangle1 from "../../assets/Rectangle1.png";
import Rectangle2 from "../../assets/Rectangle2.png";
import Rectangle3 from "../../assets/Rectangle3.png";
import Rectangle4 from "../../assets/Rectangle4.png";
import Rectangle5 from "../../assets/Rectangle5.png";

import "./styles.css";

function HomeScreen() {
  return (
    <div className="home-page">
      <div className="green-strip">
        <div>
          <h1>Vitality Coach</h1>
          <p>
            " Unleash Your Potential and Transform Your Body and Achieve Your
            Fitness Goals with Our Cutting-Edge Web App. "
          </p>
          <button type="button" className="h-btn" >Tutorial</button>

        </div>

        <div className="content">
          <img src={HeaderImage} alt="Header" />
        </div>
      </div>
    

      <div className="tutorials">
        <div className= "layer1">
        <h1>Tutorials</h1>
        <button type="button" className="tu-btn" >Tutorial</button>
        </div>
        <div className="cards">
          <div className="card">
            <img src={Rectangle1} alt={Rectangle1} />
            <h3>Squats Tutorial</h3>
            <p>Squats are a fundamental compound exercise that target multiple muscle groups in the lower body, making them a staple in any effective fitness routine. By engaging the quadriceps, hamstrings, glutes, and core muscles, squats help build lower body strength, increase muscle tone.</p>
          </div>
          <div className="card">
            <img src={Rectangle2} alt={Rectangle2} />
            <h3>Push up Tutorial</h3>
            <p>Push-ups are a classic and highly effective exercise that target multiple muscle groups in the upper body, making them a staple in any fitness routine. By primarily engaging the chest, shoulders, triceps, and core muscles, push-ups help build upper body strength, increase muscle tone.</p>
          </div>
          <div className="card">
            <img src={Rectangle3} alt={Rectangle3} />
            <h3>Plank Tutorial</h3>
            <p>The plank is a simple yet incredibly effective exercise that targets the core muscles and provides a solid foundation for overall strength and stability. By assuming a position similar to a push-up but holding it, the plank engages the muscles of the abdomen, lower back, hips, and shoulders.</p>
          </div>

        </div>
      </div>

      <div className="testimonial">
        <h1>Testimonials</h1>
        <div className="t-cards">
          <div className="t-card">
            <h3>Heading</h3>
            <div className="t-card-m">
              <div className="x">

              </div>
              <h4>Subtitle</h4>
            </div>
            <p>Some decript</p>
          </div>

          <div className="t-card">
            <h3>Heading</h3>
            <div className="t-card-m">
              <div className="x">

              </div>
              <h4>Subtitle</h4>
            </div>
            <p>Some decript</p>
          </div>

          <div className="t-card">
            <h3>Heading</h3>
            <div className="t-card-m">
              <div className="x">

              </div>
              <h4>Subtitle</h4>
            </div>
            <p>Some decript</p>
          </div>

          <div className="t-card">
            <h3>Heading</h3>
            <div className="t-card-m">
              <div className="x">

              </div>
              <h4>Subtitle</h4>
            </div>
            <p>Some decript</p>
          </div>

        </div>
        
      </div>

      <div className="vitality-coach">
        
      <div className="v-coach-sm">
          <h1>Vitality Coach</h1>
          <p>Welcome to our revolutionary fitness web app, designed to help you unleash your full potential and transform your body like never before. With our cutting-edge technology and expert guidance, you'll have the tools and resources to achieve your fitness goals in the most efficient and effective way possible</p>
        </div>
        <div>
          <img className="index1" src={Rectangle4} alt="Rectangle4"></img>
          <img className="index2" src={Rectangle5} alt="Rectangle5"></img>
        </div> 
        

      </div>
    </div>
  );
}

export default HomeScreen;
