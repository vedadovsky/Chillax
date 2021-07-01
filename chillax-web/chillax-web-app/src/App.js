import Movies from './Movies';
import TVShows from './TvShows';
import MovieDetails from './MovieDetails';
import {BrowserRouter as Router, Route, Switch} from "react-router-dom";

function App() {
 
return(
  <Router>
    <Switch>
      <Route exact path={["/", "/Movies"]}>
      <Movies/>
      </Route>
      <Route path="/TVShows">
      <TVShows/>
      </Route>
      <Route path="/details">
      <MovieDetails/>
      </Route>
    </Switch>
  </Router>
);
 
}

export default App;
