import React from "react";
import { render } from "react-dom";
import $ from 'jquery';
import Popper from 'popper.js';
import Homepage from "../components/Homepage";

// import '../stylesheets/application.scss'

document.addEventListener("DOMContentLoaded", () => {
  render(
    <Homepage />,
    document.body.appendChild(document.createElement("div"))
  );
});
