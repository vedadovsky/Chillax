import React from "react";
const IMG_API="https://image.tmdb.org/t/p/w1280/";

const TV =({name, poster_path, backdrop_path, vote_average})=>
(
    <div className="movie">
        
        <img src={IMG_API+poster_path} alt={backdrop_path}/>
        <div className="info">
            <h3>{name}</h3>
            <span>{vote_average}</span>
        </div>
    </div>
);


export default TV;