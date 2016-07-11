var style_el = document.createElement('style'), 
    slider_el = document.querySelector('input[type=range]'), 
    pp = ['-webkit-slider-runnable-', '-moz-range-'], n_pp = pp.length;

document.body.appendChild(style_el);

slider_el.addEventListener('input', function() {
  var str = '', v = this.value + '% 100%';
  
  for(var i = 0; i < n_pp; i++) {
    str += '.js input[type=range]::' + pp[i] + 'track{background-size:' + v + '}'
  }
  
  style_el.textContent = str;
}, false);