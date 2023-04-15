const groups = document.querySelectorAll(".group");
groups.forEach(element => {
  element.items = [];
});

var socket = io();

socket.emit('load scores');

socket.on('load scores', (res) => {
  res.forEach (element => {
    appendItem(groups[element.group_id - 1], element);
  });
});

function appendItem (root, obj)
{
  let item = document.createElement("div");
  item.className = "group-item";
  item.innerHTML = `<span class="group-item-rank">#1</span>
  <span class="group-item-name">${obj.nome.split(" ")[0]}</span>
  <span class="group-item-score">${obj.group_score.toLocaleString("en-US")}</span>`;
  groups[obj.group_id-1].items.push({
    element: item,
    score: 0,
    id: obj.id
  });
  reorder(groups[obj.group_id-1].items);
  let wrapper = root.getElementsByClassName("group-item-wrap")[0];
  wrapper.appendChild(item);
}

socket.on('new score', (obj) => {
  console.log(obj);
  groups[obj.group-1].items.forEach(item => {
    if (obj.id == item.id)
    {
      item.element.getElementsByClassName("group-item-score")[0].innerHTML = obj.score.toLocaleString("en-US");
      item.score = obj.score;
      reorder(groups[obj.group-1].items);
    }
  });
});

function reorder (arr)
{
  arr.sort((a, b) => {return b.score - a.score});
  let i = 0;
  arr.forEach(item => {
    if (i == 0)
      item.element.className += " group-item-first";
    else
      item.element.className = "group-item";
    item.element.style.top = i * 47 + "px";
    item.element.getElementsByClassName("group-item-rank")[0].innerHTML = "#" + (i + 1);
    i++;
  });
}