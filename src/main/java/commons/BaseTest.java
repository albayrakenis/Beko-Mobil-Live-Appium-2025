package commons;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;

import java.util.HashMap;
import java.util.Map;

public class BaseTest {


    @BeforeMethod
    @Parameters({"browserName"})
    public static void beforeMethod(String browserName) {
        System.out.println("Starting the browser session");
        System.out.println("Browser Name:"+browserName);

        if (browserName.equalsIgnoreCase("chrome")) {
            WebDriverManager.chromedriver().setup();

            // Bildirimleri kapatma ayarı
            Map<String, Object> prefs = new HashMap<>();
            prefs.put("profile.default_content_setting_values.notifications", 2); // Bildirimleri engelle

            ChromeOptions chromeOptions = new ChromeOptions();
            chromeOptions.setExperimentalOption("prefs", prefs);
            chromeOptions.addArguments("start-maximized");
            chromeOptions.addArguments("--remote-allow-origins=*");
            chromeOptions.addArguments("--disable-notifications"); // Sistem bildirim popup'ını kapatır

            MyDriver.setMyDriver(new ChromeDriver(chromeOptions));

        } else if (browserName.equalsIgnoreCase("headless")) {
            WebDriverManager.chromedriver().setup();

            Map<String, Object> prefs = new HashMap<>();
            prefs.put("profile.default_content_setting_values.notifications", 2); // Bildirimleri engelle

            ChromeOptions chromeOptions = new ChromeOptions();
            chromeOptions.setExperimentalOption("prefs", prefs);
            chromeOptions.addArguments("start-maximized");
            chromeOptions.addArguments("--headless");
            chromeOptions.addArguments("--disable-gpu"); // Headless için tavsiye edilir
            chromeOptions.addArguments("--remote-allow-origins=*");
            chromeOptions.addArguments("--disable-notifications");

            MyDriver.setMyDriver(new ChromeDriver(chromeOptions));
        }

        else if(browserName.equalsIgnoreCase("firefox")){
            WebDriverManager.firefoxdriver().setup();
            FirefoxOptions firefoxOptions = new FirefoxOptions();
          //  firefoxOptions.addArguments("start-maximized");
           // firefoxOptions.addArguments()
          //  firefoxOptions.addArguments("--remote-allow-origins=*");
            MyDriver.setMyDriver(new FirefoxDriver(firefoxOptions));
            MyDriver.getMyDriver().manage().window().maximize();

        }else {
            Assert.fail("BrowserName is not valid");
        }
    }

    @AfterMethod
    public void afterMethod() {
        System.out.println("Closing the browser session");
        MyDriver.getMyDriver().quit();

    }
}
