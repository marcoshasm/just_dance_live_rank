const table = document.getElementById('table');
const p1 = document.getElementById('p1');
const add = document.getElementById('add');
var cont = 0;

class ListNode {
  constructor(value) {
    this.value = value;
    this.next = null;
    this.element = null;
    this.rank = null;
  }
}

class LinkedList {
  constructor(head = null) {
    this.head = head;
  }

  size() {
    let count = 0;
    let node = this.head;
    while (node)
    {
      count++;
      node = node.next;
    }
    return count;
  }

  insert(item) {
    if (this.head == null)
    {
      this.head = item;
      table.appendChild(item.element);
      return;
    }

    if (item.value > this.head.value)
    {
      this.head.element.before(item.element);
      item.next = this.head;
      this.head = item;
      return;
    }
    
    let node = this.head;
    while (node)
    {
      if (node.next == null)
      {
        item.next = node.next;
        node.next = item;
        node.element.after(item.element);
        return;
      }

      if (item.value > node.next.value)
      {
        item.next = node.next;
        node.next = item;
        node.element.after(item.element);
        return;
      }

      node = node.next;
    }
  }
}

const list = new LinkedList();

function update (score) {
  let node = new ListNode(score);
  node.element = document.createElement("div");
  node.element.className = "rank-item";
  node.rank = document.createElement("span");
  node.rank.className = "rank-rank";
  node.rank.innerHTML = "#1";
  node.element.appendChild(node.rank);
  let name = document.createElement("span");
  name.className = "rank-name"
  name.innerHTML = "GABIREL";
  node.element.appendChild(name);
  let songName = document.createElement("span");
  songName.className = "rank-song-name";
  songName.innerHTML = "Baianá";
  node.element.appendChild(songName);
  let songArtist = document.createElement("span");
  songArtist.className = "rank-song-artist";
  songArtist.innerHTML = "Bakermat";
  node.element.appendChild(songArtist);
  let songIcon = document.createElement("img");
  songIcon.className = "rank-icon";
  songIcon.src = "icons/1.png";
  node.element.appendChild(songIcon);
  let rankScore = document.createElement("span");
  rankScore.className = "rank-score";
  rankScore.innerHTML = score.toLocaleString("en-US");
  node.element.appendChild(rankScore);

  list.insert(node);

  node = list.head;
  cont = 0;
  while (node)
  {
    node.element.style.top = 68 * cont + 6;
    cont++;
    node.rank.innerHTML = "#" + cont;
    node = node.next;
  }
}

add.onclick = () => {
  update(Math.floor(Math.random() * 13333));
}