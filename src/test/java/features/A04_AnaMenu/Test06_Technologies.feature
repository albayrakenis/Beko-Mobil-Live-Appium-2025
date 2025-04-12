Feature: Ana menü kontrolleri

  @smoke @teknolojiler @main @son
  Scenario Outline: Test06- Teknolojiler
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I wait "Teknolojiler" element
    And I wait until element to be clickable and click to "Teknolojiler" element
    When I see "Teknolojiler" page
    Then I sleep for 5 seconds
    And I wait "Tum teknolojiler;Ankastre Teknolojileri;Beyaz esya Teknolojileri" elements
    And I wait "Elektronik Teknolojileri;Enerji Cozum Teknolojileri;Isitma Teknolojileri;KEA Teknolojileri;" elements
    And I wait "Su Aritma Teknolojileri;Televizyon Teknolojileri" elements
    And I sleep for 2 seconds



    Examples:
      | url |
      | url |

