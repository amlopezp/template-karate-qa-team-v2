Feature: Casos de Booking

  Background:
    * def responseLogin = call read ('classpath:bdd/auth/loginAuth.feature@login-exitoso')
    * def authToken = responseLogin.authToken
    Given url urlBase

  Scenario: Caso 1 - Update booking
    * def id = 933
    And path "booking/" + id
    And header Accept = "application/json"
    And header Cookie = "token=" + authToken"
    And request read('classpath:resources/json/product/BodyBooking.json')
    When method put
    Then status 418

