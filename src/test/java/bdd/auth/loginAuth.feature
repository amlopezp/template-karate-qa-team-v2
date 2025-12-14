Feature: TC de login

  @login-exitoso
  Scenario: Caso 1 - login exitoso
    Given url urlBase
    And path "/auth"
    And request read('classpath:resources/json/auth/bodyLoginAuth.json')
    When method post
    Then status 200
    * def authToken = response.token
    * print "Mi variable es: "+ authToken


     @login-fallido
  Scenario: Caso 2 - login con contraseña incorrecta
    Given url urlBase
    And path "/auth"
    And request
      """
      {
        "username" : "admin",
        "password" : "123456"
    }
      """
    When method post
    Then status 200
    And match response.reason == "Bad credentials"