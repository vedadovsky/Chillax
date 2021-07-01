import React from "react";
const IMG_API="https://image.tmdb.org/t/p/w1280/";

const MovieDetail =({title, poster_path, backdrop_path, vote_average, overview})=>
(
    <div className="movieDetail">
        
        <img src={IMG_API+poster_path} alt={backdrop_path}/>
        <div className="info">
            <h3>{title}</h3>
            <span>{vote_average}</span>
        </div>
        <div className="text">
        <p>{overview}</p>
        </div>

    </div>
);


export default MovieDetail;