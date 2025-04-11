Feature: Ana sayfa kontrolleri

  @smoke @header @AR
  Scenario Outline: Test13- Artırılmis Gerceklik


    Then I go to "<url>" with configuration
    When I see "HomePage" page
    And I sleep for 2 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    And I scroll until find "Artirilmis gerceklik" element with action
    And I wait until element to be clickable and click to "Artirilmis gerceklik" element
    #And I check "AR text" element text is equal "Artırılmış Gerçeklik (AR) deneyimine hoş geldiniz!"
    #And I check "AR arama sonuclari" element text is equal "Arama Sonuçları"
   # And I scroll until find "AR ilk urun" element with action
   # And I wait "AR ilk urun" element
   # And I wait until element to be clickable and click to "AR ilk urun" element
    #And I scroll until find "PDP AR yazisi" element with action
   # And I wait "PDP AR yazisi" element
    #And I wait until element to be clickable and click to "PDP AR yazisi" element
   # And I check "PDP AR yazisi" element text is equal "Artırılmış Gerçeklik (AR) deneyimine hoş geldiniz!"
   # And I sleep for 6 seconds



    Examples:
      | url |
      | url |