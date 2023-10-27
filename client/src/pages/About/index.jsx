import React from "react";
import HeaderImage from "../../assets/homePage.png";
import Rectangle1 from "../../assets/Rectangle1.png";
import "./styles.css";

function About() {
  return (
    <div className="home-page">
      <header className="green-strip">
        <div>
          <h1>Vitality Coach</h1>
          <p>" The application we have developed as our project is a platform that provides personalised workout plans, and diet plans. "</p>
        </div>
        

        <div className="content">
          <img src={HeaderImage} alt="Header" />
        </div>
      </header>

      <div className="about1"> 
        <img src={Rectangle1} alt="Rectangle1" />
        <div>
        <h2>And Best of all...</h2>
        <p>  It is a health tracker web app that serves a unique purpose focusing on steady cumulative progress while simultaneously minimising the risks of significant setbacks on progress, such as when injuries occur. After we have done..
</p>
        <p>-Literature review</p>
        <p>-Market Research</p>
        <p>-Carefully extracted out a list of growing demands for users' needs</p>
        <p>We concluded that our concept evaluation is justified by the general conditions of individuals seeking fitness application support</p>
        </div>
      </div>
    </div>
  );
}

export default About;
