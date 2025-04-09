Feature: Ana menü kontrolleri

  @smoke @servis @main
  Scenario Outline: Test11- Servis randevusu
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I wait "Servis randevusu" element
    And I wait until element to be clickable and click to "Servis randevusu" element
    And I sleep for 2 seconds

    When I see "Servis" page

    And I wait "Beraber cozelim text" element
    And I check "Beraber cozelim text" element text is equal "Beraber Çözelim'e Hoş Geldiniz!"
    #And I wait until element to be clickable and click to "Menuyu acma" element
    And I wait "Garanti Uzatma;Garanti Sorgula;Acik Taleplerim;Urun Kilavuzu;Yetkili Servis Sorgulama" elements


#    And I wait "Destek box" element
#    And I scroll until find "Destek kaydi ac" element with action
#    And I send key to "Destek box" element text:"ab"
#




    Examples:
      | url |
      | url |

