import {useEffect, useState} from 'react';
import TV from './components/TVComponent';
import Logo from './assets/chillax2.svg';

//due to it being a demo project I will not safe keep the API
const SEARCH_API="https://api.themoviedb.org/3/search/tv?api_key=89eef3426d167c3c8145a257ebe68357&query=";
const TOP_RATED_API="https://api.themoviedb.org/3/tv/top_rated?api_key=89eef3426d167c3c8145a257ebe68357&page=1"

function TVShows() {
  const [tvs, setTVs] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');

useEffect(()=>{
  fetch(TOP_RATED_API)
  .then((res)=>res.json())
  .then((data)=>{
    console.log(data);
    setTVs(data.results);
  });

},[]);



const handleOnSubmit= (e)=> {
  e.preventDefault();


  if(setSearchTerm){
  fetch(SEARCH_API+searchTerm)
  .then((res)=>res.json())
  .then((data)=>{
    console.log(data);
    setTVs(data.results);
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
  <img className="logo" src={Logo}></img>
  <div className="nav-bar-button">
    <a href="/Movies" >Movies</a>
    <a href="/TVShows" className="film">TV Shows</a>
  <input className="search-bar" type="search" placeholder="Search"  value={searchTerm} onChange={handleOnChange}/>
  </div>
  </form>
  </header>

  <div className="container">
    {tvs.length && tvs.map((movie)=>
    <TV key={movie.id} {...movie}/>)}
  </div> 
  </>
);
 
}

export default TVShows;
