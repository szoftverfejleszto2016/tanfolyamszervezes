const max = 8;
let adatok;
csoportok();

function csoportok() {
    const url = 'http://localhost:5000/public/csoportok';
    const tabla = document.getElementById("csoportok");
    fetch(url)
        .then((response) => response.json())
        .then(json => {
            adatok = json;
            tabla.innerHTML = "<tr><th>Azonosító</th><th>Képzés</th><th>Indulás</th>"
                            + "<th>Beosztás</th><th>Szabad hely</th><th>Ár (Ft)</th></tr>";
            json.forEach(cs => {
                tabla.innerHTML += "<tr><td>" + cs.csid + "</td><td>" + cs.knev 
                + "</td><td>" + cs.indulas + "</td><td>" + cs.beosztas 
                + "</td><td>"+(max-cs.letszam)+"</td><td>"+cs.ar.toLocaleString()+"</td></tr>"
            });
        })
        .catch(err => console.log(err));
}

function ellenoriz() {
    // nem számot írtak be
    let cs = document.getElementById("csid").value;
    if (isNaN(cs)) return "Hibás csoportazonosító!";
    // nincs ilyen csoport
    let van = false;
    let index;
    for (let i=0; i < adatok.length; i++)
        if (adatok[i].csid == cs) {
            van = true;
            index = i;
        }
    if (!van) return "Nincs ilyen csoport!";
    // betelt a csoport
    if (adatok[index].letszam == max) return "A csoport betelt!";
    //hibás név
    let nev = document.getElementById("jnev").value;
    if (nev.trim().length < 5) return "Hibás név!"
    // hiányzó dátum
    let d = document.getElementById("szulido").value;
    if (d == "") return "Add meg a dátumot!";
    // 18 évnél fiatalabb
    let ev = d.substring(0,4);
    if (ev >= new Date().getFullYear()-18) 
        return "Hibás születési idő!"
    // hibás születési hely
    let hely = document.getElementById("szulhely").value;
    if (hely.trim().length < 2) return "Hibás születési hely!"
    // anyja neve hibás
    let an = document.getElementById("anyjaneve").value;
    if (an.trim().length < 5) return "Anyja neve hibás!"
    // cím hibás
    let cim = document.getElementById("cim").value;
    if (cim.trim().length < 15) return "A cím hibás!"
    // telefon hibás
    let telefon = document.getElementById("telefon").value;
    if (telefon.trim().length < 8) return "A teleofnszám hibás!"
    // pipa
    if (!document.getElementById("tandij").checked)
        return "Kapcsold be a pipát!"
    return "";
}

document.getElementById("gomb").onclick = function (e) {
    e.preventDefault();
    let valasz = ellenoriz();
    document.getElementById("uzenet").innerHTML = valasz;
    if (valasz) return;
    const url = 'http://localhost:5000/public/jelentkezok';
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify({
            "csid": document.getElementById("csid").value,
            "jnev": document.getElementById("jnev").value,
            "szulnev": document.getElementById("szulnev").value,
            "szulido": document.getElementById("szulido").value,
            "szulhely": document.getElementById("szulhely").value,
            "anyjaneve": document.getElementById("anyjaneve").value,
            "cim": document.getElementById("cim").value,
            "telefon": document.getElementById("telefon").value,
            "email": document.getElementById("email").value
        })
    })
        .then(resp => {
            document.getElementById("uzenet").innerHTML = "Köszönjük jelentkezésedet!";
            document.getElementById("gomb").disabled = true;
        })
		.then(csoportok())
        .catch(err => console.log(err));
}