@search12 @regression
Feature: Ürün Arama ve Listeleme Özellikleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "search box;search icon" elements

  @search_basic
  Scenario: Arama Kutusundan Ürün Arama
    When I send key to "search box" element text:"buzdolabı"
    Then I wait until element to be clickable and click to "search icon" element
    Then I see "PLP" page
    Then I wait "product footer" element
    Then I check element count is greater than "0" with xpath "//div[@class='prd-footer']"

  @search_category
  Scenario: Kategori Üzerinden Ürün Listeleme
    When I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I see "PLP" page
    Then I wait "product footer" element
    Then I check element count is greater than "0" with xpath "//div[@class='prd-footer']"

  @search_filter
  Scenario: Filtreli Ürün Arama
    When I send key to "search box" element text:"çamaşır makinesi"
    Then I wait until element to be clickable and click to "search icon" element
    Then I see "PLP" page
    Then I wait "product footer" element
    Then I check element count is greater than "0" with xpath "//div[@class='prd-footer']"
    # Fiyat filtreleme eklenebilir
    # Özellik filtreleme eklenebilir
    # Sıralama seçenekleri eklenebilir

  @search_empty
  Scenario: Sonuç Bulunamayan Arama
    When I send key to "search box" element text:"xyzabc123"
    Then I wait until element to be clickable and click to "search icon" element
    Then I see "PLP" page
    Then I check element count is equal "0" with xpath "//div[@class='prd-footer']"

  @search_subcategory
  Scenario: Alt Kategori Üzerinden Ürün Listeleme
    When I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I wait until element to be clickable and click to "Buzdolabi" element
    Then I see "PLP" page
    Then I wait "product footer" element
    Then I check element count is greater than "0" with xpath "//div[@class='prd-footer']"
