Feature: Testando Fake Store API

Background: Executa antes de cada teste
    * def url_base = 'https://fakestoreapi.com/'
    * def request_json_post = read("json_testPost.json")
    * def request_json_put = read("json_testPut.json")


Scenario: Testando retorno de produtos
        Given url url_base
        And path 'products'
        When method get
        Then status 200

Scenario: Testando o retorno de produtos com informações inválidas.
        Given url url_base
        And path 'peixe'
        When method get
        Then status 404

Scenario: Testando o retorno do primeiro pruduto e verificando o JSON.
        Given url url_base
        And path 'products/1'
        When method get
        Then status 200
        And match response.id == 1
        And match response.category == "men's clothing"

Scenario: Testando solicitação com método HTTP inválido
        Given url url_base
        And path 'products'
        When method delete
        Then status 404

Scenario: Testando o metodo post de products
        Given url url_base
        And path 'products'
        And request request_json_post
        When method post
        Then status 200
        And match response.title == "title test"
        And match response.price == 109.95
        And match response.description == "description test"
        And match response.category == "category test"

Scenario: Atualizando um produto existente
    Given url url_base
    And path 'products/1'
    And request request_json_put
    When method put
    Then status 200
    And match response.title == "new title"
    And match response.price == 59.99
    And match response.description == "new description"
    And match response.category == "new category"
