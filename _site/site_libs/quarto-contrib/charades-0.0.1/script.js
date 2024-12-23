function charades_choose() {

  const el = document.getElementById('charade_but');
  let ar = JSON.parse(el.getAttribute('data-array'));

  // choose a random charade
  const index = Math.floor(Math.random()*ar.length);
  const charade_name = ar[index];

  // drop item from array
  ar = ar.filter(item => item !== charade_name);

  // update array list attached to button
  if (ar.length == 0) {
    el.disabled = true;
  } else {
    el.setAttribute('data-array', JSON.stringify(ar));
  }

  // update name of charade
  document.getElementById("charade_text").innerHTML = charade_name;
}