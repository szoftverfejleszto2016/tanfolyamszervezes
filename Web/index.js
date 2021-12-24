function osszes() {
    const url = 'http://localhost:5000/public/csoportok';
    const tabla = document.getElementById("csoportok");
    fetch(url)
        .then((response) => response.json())
        .then(json => {
            tabla.innerHTML = "<tr><th>Azonosító</th><th>Képzés</th><th>Indulás</th></tr>";
            json.forEach(cs => {
                tabla.innerHTML += "<tr><td>" + cs.csid + "</td><td>" + cs.kid + "</td><td>" + cs.indulas + "</td></tr>"
            });
        })
        .catch(err => console.log(err));
}
osszes();

document.getElementById("gomb").onclick = function (e) {
    e.preventDefault();
    const url = 'http://localhost:3000/cars';
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify({
            "rendszam": document.getElementById("rendszam").value,
            "tipus": document.getElementById("tipus").value,
            "ev": document.getElementById("ev").value
        })
    })
        .then((response) => response.json())
        .then(json => console.log(json))
		.then(osszes())
        .catch(err => console.log(err));
}