Feature: Urun Gorselleri


  @image @smoke
  Scenario Outline: PLP de urun gorselleri kontrolu

    Given I go to "urlCanli" with configuration
    When I click "<kategori>" element and save the file "<Dosya Adi>"


    Examples:
      | kategori                 | Dosya Adi        |
      | Beyaz Eşya               | beyazesya        |
      | Ankastre                 | ankastre         |
      | Enerji Çözümleri         | enerji cozumleri |
      | Televizyon               | televizyon       |
      | Elektronik               | elektronik       |
      | Isıtma Soğutma ve Enerji | isitma           |
      | Küçük Ev Aletleri        | kea              |
      | Hijyen-Aksesuar-Oto      | hijyen           |
