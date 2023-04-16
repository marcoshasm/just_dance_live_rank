const cover = document.getElementById("cover");
const title = document.getElementById("title");
const artist = document.getElementById("artist");

var socket = io();

socket.on('draft song', (res) => {
    console.log(res);
    cover.src = res.id + ".png";
    title.innerHTML = res.nome;
    artist.innerHTML = res.artista;
})