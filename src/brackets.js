const items = document.getElementsByClassName("item");

var socket = io();

socket.emit('load brackets');

socket.on('load brackets', res => {
    console.log(res);
    let i = 0;
    res.forEach(item => {
        items[i].innerHTML = item.nome;
        i++;
    }
    );
});