Feature: Ana sayfa kontrolleri

  @smoke @header @beraber
  Scenario Outline: Test12- Beraber Secelim

    Then I go to url:"<url>"
    When I see "HomePage" page
    And I sleep for 2 seconds
    And I scroll until find "Beraber Secelim" element with action
    And I check "Beraber Secelim Text" element text is equal "Beraber Seçelim"
    And I check "Beraber Secelim Kucuk Text" element text is equal "Hangi kategoride ürün arıyorsunuz?"
    And I scroll until find "Beraber Secelim" element with action
    And I sleep for 5 seconds
    Then I wait until element to be clickable and click to "Beraber Secelim" element
    And I change the frame
    And I sleep for 1 seconds
    When I see "BeraberSecelim" page
    And I wait until element to be clickable and click to "BS beyaz esya" element
    And I sleep for 5 seconds
    And I wait until element to be clickable and click to "BS buzdolabı" element
    And I sleep for 5 seconds
    And I wait until element to be clickable and click to "BS benim icin sec" element
    And I sleep for 5 seconds




    Examples:
      | url                                        |
      | https://akamai-s1-astra-stage.beko.com.tr/ |

