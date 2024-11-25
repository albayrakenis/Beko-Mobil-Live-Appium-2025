Feature: Urun Gorselleri


  @image
  Scenario Outline: PLP de urun gorselleri kontrolu

    Given I go to url:"https://www.beko.com.tr/"
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
