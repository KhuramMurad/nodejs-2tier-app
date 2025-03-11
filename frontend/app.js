async function saveData() {
  const text = document.getElementById("userInput").value;
  await fetch("http://localhost:5000/save", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ text }),
  });
  loadData();
}

async function loadData() {
  const response = await fetch("http://localhost:5000/fetch");
  const data = await response.json();
  const list = document.getElementById("dataList");
  list.innerHTML = "";
  data.forEach(item => {
    const li = document.createElement("li");
    li.textContent = item.text;
    list.appendChild(li);
  });
}

window.onload = loadData;
