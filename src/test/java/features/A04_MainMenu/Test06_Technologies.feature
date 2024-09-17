Feature: Ana menü kontrolleri

  @smoke @teknolojiler @main
  Scenario Outline: Test06- Teknolojiler
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I wait "Teknolojiler" element
    And I wait until element to be clickable and click to "Teknolojiler" element
    When I see "Teknolojiler" page
    Then I sleep for 5 seconds
    And I wait "Tum teknolojiler;Akilli Telefon Teknolojileri;Giyilebilir Teknolojiler;Goruntu Teknolojileri" elements
    And I wait "Kisisel Bakim Teknolojileri;Mutfak Teknolojileri;Sogutma Teknolojileri;Süpürge Teknolojileri" elements
    And I wait "Yikama Teknolojileri;Odeme Sistemleri Teknolojileri" elements

    And I sleep for 2 seconds



    Examples:
       | url                                        |
       | https://akamai-s1-astra-stage.beko.com.tr/ |

