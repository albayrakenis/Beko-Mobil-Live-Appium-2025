
Feature: Beko siparis

  @beko
   Scenario:Login Test
    When I see "Beko" page
    Then I go to url:"https://akamai-s1-astra-stage.beko.com.tr/"
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    Then I wait until element to be clickable and click to "uyelik button" element