import {useEffect, useState} from 'react';
import { Link } from 'react-router-dom';
import Movie from './components/MovieComponent';
import Logo from './assets/chillax2.svg';
import MovieDetails from './MovieDetails';

//due to it being a demo project I will not safe keep the API
const SEARCH_API="https://api.themoviedb.org/3/search/movie?api_key=89eef3426d167c3c8145a257ebe68357&query=";
const TOP_RATED_API="https://api.themoviedb.org/3/movie/top_rated?api_key=89eef3426d167c3c8145a257ebe68357&page=1"

function Movies() {
  const [movies, setMovies] = useState([]);
  const [id, setID] = useState('');
  const [searchTerm, setSearchTerm] = useState('');

useEffect(()=>{
  fetch(TOP_RATED_API)
  .then((res)=>res.json())
  .then((data)=>{
    console.log(data);
    setMovies(data.results);
    setID(data.results)
  });

},[]);



const handleOnSubmit= (e)=> {
  e.preventDefault();


  if(setSearchTerm){
  fetch(SEARCH_API+searchTerm)
  .then((res)=>res.json())
  .then((data)=>{
    console.log(data);
    setMovies(data.results);
  });

  setSearchTerm('');
}
} 

const handleOnChange= (e)=> {
  setSearchTerm(e.target.value);
}  
 

return(
  <>

  <header>   
  <form onSubmit={handleOnSubmit}>
  <img href="/" className="logo" src={Logo}></img>
  <div className="nav-bar-button">
    <a href="/Movies" className="film">Movies</a>
    <a href="/TVShows" >TV Shows</a>
  <input className="search-bar" type="search" placeholder="Search"  value={searchTerm} onChange={handleOnChange}/>
  </div>
  </form>
  </header>

  <div className="container">
    {movies.length && movies.map((movie)=>
    <Movie key={movie.id} {...movie} />)}
  </div> 
  </>
);
 
}

export default Movies;
