Feature: Ejemplos practicos Karate

  @CP07
  Scenario: Crear un post con docString en variable
    * def body = read('classpath:resources/json/auth/bodyLogin.json')
    Given url "https://jsonplaceholder.typicode.com"
    And path "posts"
    And request body
    When method post
    Then status 201
    And match response.title == "foo"
    And match response.body == "bar"
    And match response.userId == 1

  Scenario: Test 02 - JS
    Given url "https://jsonplaceholder.typicode.com"
    And path "/posts"
    And header Authorization = call read('classpath:resources/js/commom/practica.js') {"username": "admin", "password": "123456"}
    And request { "title": "foo","body": "bar", "userId": 1}
    When method post
    Then status 201

  Scenario: Test 03 - JAVA
    * def javaPosts = Java.type('resources.java.commom.Prueba')
    * def id = javaPosts.idPosts();
    * print id
    Given url "https://jsonplaceholder.typicode.com"
    And path "/posts/" + id
    When method get
    Then status 200
