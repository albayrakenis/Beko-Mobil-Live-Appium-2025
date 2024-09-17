Feature: Ana menü kontrolleri

  @smoke @slider @main
  Scenario Outline: Test05- Slider Kategoriler
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I scroll until find "Beraber secelim button" element with action
    Then I sleep for 3 seconds
    And I wait "Beyaz esya slider;Elektronik slider;Ankastre slider;Kucuk ev aletleri slider;Isitma sogutma slider;Cep Telefonu slider;Bilgisayar slider" elements

    And I sleep for 5 seconds



    Examples:
       | url                                        |
       | https://akamai-s1-astra-stage.beko.com.tr/ |

