import React from "react";
import Card from "react-bootstrap/Card";
import { ImPointRight } from "react-icons/im";

function AboutCard() {
  return (
    <Card className="quote-card-view">
      <Card.Body>
        <blockquote className="blockquote mb-0">
          <p style={{ textAlign: "justify" }}>
            Hi Everyone, I am <span className="purple">Mew Cloud </span>
            from <span className="purple"> Hanoi, Vietnam.</span>
            <br />I am a junior DevOps and Cloud Engineer in Vietnam
            <br />
            <br />
            Apart from coding, some other activities that I love to do!
          </p>
          <ul>
            <li className="about-activity">
              <ImPointRight /> Take a photo 📸
            </li>
            <li className="about-activity">
              <ImPointRight /> Chill 🎧 🎼
            </li>
            <li className="about-activity">
              <ImPointRight /> Travelling ✈️
            </li>
          </ul>

          <p style={{ marginBlockEnd: 0, color: "rgb(155 126 172)" }}>
            "Today I do what no one else dares to do so that tomorrow I will receive what no one else will !"{" "}
          </p>
          <footer className="blockquote-footer">MewCloud</footer>
        </blockquote>
      </Card.Body>
    </Card>
  );
}

export default AboutCard;
