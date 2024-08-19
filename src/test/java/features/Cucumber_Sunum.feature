Feature: Ana sayfa kontrolleri
  
  Scenario: test01 basarili login
    Given I go to url:"https://akamai-s1-astra-stage.beko.com.tr/"
    When I see "HomePage" page
    And I sleep for 10 seconds
    And I check "hesabim" element text is equal "Hesabim"