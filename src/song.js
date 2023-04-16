const cover = document.getElementById("cover");
const title = document.getElementById("title");
const artist = document.getElementById("artist");

var socket = io();

socket.on('draft song', (res) => {
    console.log(res);
    cover.style.display = "block";
    cover.src = "music-list/" + res.id + ".jpeg";
    title.innerHTML = res.nome;
    artist.innerHTML = res.artista;
})

cover.onerror = () => {
    let str = cover.src;
    let arr = str.split(".");
    cover.src = arr[0] + ".jpg";
};