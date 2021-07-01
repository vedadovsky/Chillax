import {useEffect, useState} from 'react';
import { Link } from 'react-router-dom';
import MovieDetail from './components/MovieDetailComponents';
import Logo from './assets/chillax2.svg';

//due to it being a demo project I will not safe keep the API
const SEARCH_API="https://api.themoviedb.org/3/search/movie?api_key=89eef3426d167c3c8145a257ebe68357&query=";
const TOP_RATED_API="https://api.themoviedb.org/3/movie/top_rated?api_key=89eef3426d167c3c8145a257ebe68357&page=1"

function MovieDetails() {
  const [movies, setMovies] = useState([]);
  const [id, setID] = useState('');


useEffect(()=>{
  fetch(TOP_RATED_API)
  .then((res)=>res.json())
  .then((data)=>{
    console.log(data);
    setMovies(data.results);
  });

},[]);
 
return(
  <>

  <header> 
    <form>
  <img href="/" className="logo" src={Logo}></img>
  <div className="nav-bar-button">
    <a href="/Movies" className="film">Movies</a>
    <a href="/TVShows" >TV Shows</a>
  </div>
  </form>  
  </header>

  <div>
    {movies.length && movies.map((movie)=>
    <MovieDetail key={movie.id} {...movie}/>)}
  </div> 
  </>
);
 
}

export default MovieDetails;
