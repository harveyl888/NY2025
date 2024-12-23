function array_choose(type) {

  const but_id = type + '_but';
  const text_id = type + '_text';

  const el = document.getElementById(but_id);
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
  document.getElementById(text_id).innerHTML = charade_name;
}