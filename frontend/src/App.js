import React from 'react';
import Navbar from './Components/Navbar';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Home from './Components/Home';
import Contact from './Components/Contact';
import About from './Components/About';

function App() {
  return (
    <div className="App">
       <BrowserRouter>
        <Navbar/>
          <Switch>
            <Route exact path="/" component={Home}></Route>
            <Route exact path="/contact" component={Contact}></Route>
            <Route exact path="/about" component={About}></Route>
          </Switch>
       </BrowserRouter>
    </div>
  );
}

export default App;