Feature: Endpoint de productos
  Scenario: Caso v1 product
    * def validateScheme = read('classpath:resources/json/schema/schemes.json')
    Given url "https://fakestoreapi.com"
    And path "products"
    And request
    """
    {
    "title": "New Product",
    "price": 29.99
}
    """
    When method post
    Then status 201
    And match response == validateScheme.product


  Scenario: Caso v2 product
    * def validateScheme = read('classpath:resources/json/schema/schemes.json')
    * def defrequest =
        """
    {
    "title": "New Product",
    "price": 29.99
}
    """

    Given url "https://fakestoreapi.com"
    And path "products"
    And match defrequest == validateScheme.request
    And request defrequest
    When method post
    Then status 201
    And match response == validateScheme.product

  Scenario Outline: Caso v3 product
    * def validateScheme = read('classpath:resources/json/schema/schemes.json')
    * def priceFinal = <price> + 0
    Given url "https://fakestoreapi.com"
    And path "products"
    And request read('classpath:resources/json/product/requestProduct.json')
    When method post
    Then status 201
    And match response == validateScheme.product

    Examples:
      | title     | price |
      | televisor | 1000  |
      | laptop    | 2000  |
      | cocina    | 100   |


  Scenario Outline: Caso v4 product csv <title>
    * def validateScheme = read('classpath:resources/json/schema/schemes.json')
    * def priceFinal = <price> + 0
    Given url "https://fakestoreapi.com"
    And path "products"
    And request
    """
    {
    "title": "#(title)",
    "price": #(priceFinal)
    }
    """
    When method post
    Then status 201
    And match response == validateScheme.product

    Examples:
      | read('classpath:resources/csv/product/product.csv')


  Scenario Outline: Caso v5 product csv+arc int <title>
    * def validateScheme = read('classpath:resources/json/schema/schemes.json')
    * def priceFinal = <price> + 0
    Given url "https://fakestoreapi.com"
    And path "products"
    And request read('classpath:resources/json/product/requestProduct.json')
    When method post
    Then status 201
    And match response == validateScheme.product

    Examples:
      | read('classpath:resources/csv/product/product.csv')