const cover = document.getElementById("cover");
const title = document.getElementById("title");
const artist = document.getElementById("artist");
const wrap = document.getElementById("wrap");

var socket = io();

socket.on('draft song', (res) => {
    console.log(res);
    //cover.style.display = "block";
    wrap.innerHTML = res.dificuldade;
    switch (res.dificuldade) {
        case "Fácil":
            wrap.style.backgroundColor = "green";
            break;
        case "Média":
            wrap.style.backgroundColor = "orange";
            break;
        case "Difícil":
            wrap.style.backgroundColor = "gainsboro";
            break;
        case "Extrema":
            wrap.style.backgroundColor = "crimson";
            break;
    }
    wrap.style.animation = "none";
    wrap.style.backgroundImage = "none";
    cover.src = "music-list/" + res.id + ".jpeg";
    title.innerHTML = res.nome;
    artist.innerHTML = res.artista;
})

cover.onerror = () => {
    let str = cover.src;
    let arr = str.split(".");
    cover.src = arr[0] + ".jpg";
};