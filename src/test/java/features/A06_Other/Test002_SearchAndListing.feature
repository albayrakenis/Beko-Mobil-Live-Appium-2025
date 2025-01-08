@search12 @regression @smoke
Feature: Ürün Arama ve Listeleme Özellikleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    And I go to url:"https://akamai-s1-astra-stage.beko.com.tr/"
    #Then I wait "search box;search box text" elements

  @search_basic
  Scenario: Arama Kutusundan Ürün Arama

    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"buzdolabı"
    Then I wait until element to be clickable and click to "search icon" element
    Then I sleep for 3 seconds
    Then I see "PLP" page
    Then I wait "product footer buzdolabi" element
    Then I check element count is greater than "0" with xpath "p.product-result-text > #article-length"

  @search_category
  Scenario: Kategori Üzerinden Ürün Listeleme
    When I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I see "PLP" page
    Then I wait "product footer" element
    Then I check element count is greater than "0" with xpath "b"



  @search_empty
  Scenario: Sonuç Bulunamayan Arama
    When I see "HomePage" page
    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"xyzabc123"
    Then I wait until element to be clickable and click to "search icon" element
    Then I sleep for 3 seconds
    #Then I see "PLP" page
    Then I check element count is equal "0" with xpath "//span[@id='article-length']"

  @search_subcategory
  Scenario: Alt Kategori Üzerinden Ürün Listeleme
    When I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I see "PLP" page
    And I sleep for 4 seconds
    #Then I scroll until find "Buzdolabi PLP" element with action
    Then I wait until element to be clickable and click to "Buzdolabi PLP" element

    Then I wait "product footer" element
    Then I check element count is greater than "0" with xpath "b"
