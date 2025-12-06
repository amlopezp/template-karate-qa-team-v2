function fn() {
  var env = karate.env;

  var config = {
    env: env,
    urlBase: 'https://restful-booker.herokuapp.com'
  }

  return config;
}