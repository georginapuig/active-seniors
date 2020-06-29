const initGeolocation = () => {
  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };
  
  function success(pos) {
    var crd = pos.coords;

    // let url = new URL('https://example.com?foo=1&bar=2');
    // let params = new URLSearchParams(url.search.slice(1));

    // params.has('bar') === true; //true
    
    let url = new URL(window.location.href);
    let params = new URLSearchParams(url.search.slice(1));

    if (!(params.has('lng'))) {
      window.location.href = window.location.href + `?lat=${crd.latitude}&lng=${crd.longitude}`;
    }
    
    console.log('Your current position is:');
    console.log('Latitude : ' + crd.latitude);
    console.log('Longitude: ' + crd.longitude);
    console.log('More or less ' + crd.accuracy + ' meters.');
  }
  
  function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
  }
  console.log('hello');

  navigator.geolocation.getCurrentPosition(success, error, options);
};

initGeolocation();