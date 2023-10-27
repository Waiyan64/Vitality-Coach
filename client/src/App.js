import React from "react";
import { BrowserRouter as Router, Route, Routes, Link } from "react-router-dom";
import "./App.css";
import logo from "./assets/logo.png";
import { StateProvider, initialState } from "./StateContext";
import reducer from "./reducer";

// Importing components for each screen
import Home from "../src/pages/Home";
import About from "../src/pages/About";
import Plan from "../src/pages/Plan";
import Traning from "../src/pages/Training";
import Tutorial from "../src/pages/Tutorial";
import Contact from "../src/pages/Contact";

function App() {

  return (
    <StateProvider reducer={reducer} initialState={initialState}>
      <Router>
        <div className="App">
          <nav className="mainNav">
            <ul>
              <li className="logo">
                <div className="logo">
                  <img src={logo} className="App-logo" alt="logo" />
                </div>
              </li>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/about">About</Link>
              </li>
              <li>
                <Link to="/training">Generate Training & Diet Plan</Link>
              </li>
              <li>
                <Link to="/tutorial">Tutorial</Link>
              </li>
              <li>
                <Link to="/contact">Contact</Link>
              </li>
            </ul>
          </nav>

          <Routes>
            <Route path="/about" element={<About />} />
            <Route path="/training" element={<Traning />} />
            <Route path="/plan" element={<Plan />} />
            <Route path="/tutorial" element={<Tutorial />} />
            <Route path="/contact" element={<Contact />} />
            <Route path="/" element={<Home />} />
          </Routes>

          <footer className="App-footer">
            <div className="logo">
              <img src={logo} className="App-logo" alt="logo" />
            </div>
            <nav className="footer-nav">
              <Link to="/">Home</Link>
              <Link to="/about">About</Link>
              <Link to="/training">Generate Training & Diet Plan</Link>
              <Link to="/tutorial">Tutorial</Link>
              <Link to="/contact">Contact</Link>
            </nav>
            <nav className="footer-nav">
              <p>Contacts</p>
              <div></div>
              <p>Address</p>
              <p>Phone number</p>
              <p>email</p>
            </nav>
            <nav className="footer-nav">
              <p>Social Media links</p>
              <div></div>
              <p>Address</p>
              <p>Phone number</p>
              <p>email</p>
            </nav>
          </footer>
        </div>
      </Router>
    </StateProvider>
  );
}

export default App;
