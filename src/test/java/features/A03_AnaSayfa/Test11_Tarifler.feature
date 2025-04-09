Feature: Ana sayfa kontrolleri

  @smoke @tarifler @homepage
  Scenario Outline: Test11- Tarifler sayfasinin kontrolu

    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    And I scroll until find "Tum tarifler button" element with action
    And I sleep for 2 seconds
    Then I wait "Tum tarifler button;Tarifler text;Devamini gor text;anasayfa ornek tarif" elements
    And I wait until element to be clickable and click to "Tum tarifler button" element
    And I sleep for 2 seconds
    When I see "Tarifler" page
    Then I wait "Tarif 1;Tarif 2;Tarif 3;Tarif 4" elements
    And I scroll until find "Tarif 8" element with action
    Then I wait "Tarif 5;Tarif 6;Tarif 7;Tarif 8" elements
    And I scroll until find "Tarif 12" element with action
    Then I wait "Tarif 9;Tarif 10;Tarif 11;Tarif 12" elements
    And I scroll until find "Tarif 16" element with action
    Then I wait "Tarif 13;Tarif 14;Tarif 15;Tarif 16" elements
    And I scroll until find "Tarif 21" element with action
    Then I wait "Tarif 17;Tarif 18;Tarif 19;Tarif 20;Tarif 21" elements
    And I scroll until find "Tarif 21" element with action
    And I wait until element to be clickable and click to "Tarif 21" element
    And I scroll until find "Filtrele button" element with action
    And I wait until element to be clickable and click to "Filtrele button" element
    And I sleep for 2 seconds
    Then I wait "Saglikli Icecekler;Kahvalti;Ogle Yemegi;Saglikli Alistirmaliklar;Aksam Yemegi;Tatli" elements
    Then I wait "Filtrele 2;Tarif Tipi;Uygula Button" elements
    And I wait until element to be clickable and click to "Uygula Button" element
    And I sleep for 7 seconds
    Then I wait "Tarif sayisi text;Filtrele button" elements


    Examples:
      | username              | password    | url |
      | beko.s1test@gmail.com | Albayrak.41 | url |