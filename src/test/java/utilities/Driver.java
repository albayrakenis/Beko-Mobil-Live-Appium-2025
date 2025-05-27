package utilities;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import utilities.Driver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.safari.SafariDriver;

import java.util.concurrent.TimeUnit;

public class Driver {

     /**
      * explanation: Creating a private constructor, so we are closing
      *              access to the object of this class from outside the class
     */
    private Driver(){}

    /**
     * explanation: We make WebDriver private, because we want to close access from outside the class.
     *              We make it static because we will use it in a static method.
     */
    private static InheritableThreadLocal<WebDriver> driverPool = new InheritableThreadLocal<>();

    /**
     * explanation: Create a re-usable utility method which will return same driver instance when we call it.
     *              We read our browserType from configuration.properties. This way,
     *              we can control which browser is opened from outside our code, from configuration.properties.
     *              Depending on the browserType that will be return from configuration.properties file
     *              switch statement will determine the case, and open the matching browser.
     */
    public static WebDriver getDriver(){
        if ( driverPool.get() == null ){

            String browserType = ConfigurationReader.getProperty("browser");
            switch (browserType.toLowerCase()) {
                case "chrome":
                    // Manually set browser version of Chrome due to SessionNotCreated exception.
                    WebDriverManager.chromedriver().browserVersion("124.0.6367.62").setup();
                    driverPool.set(new ChromeDriver());
                    break;
                case "firefox":
                    WebDriverManager.firefoxdriver().setup();
                    driverPool.set(new FirefoxDriver());
                    break;
                case "safari":
                    WebDriverManager.safaridriver().setup();
                    driverPool.set(new SafariDriver());
                    break;
                case "ie":
                    WebDriverManager.iedriver().setup();
                    driverPool.set(new InternetExplorerDriver());
                    break;
                default:
                    throw new RuntimeException("Invalid Browser Type : " + browserType);
            }
            driverPool.get().manage().window().maximize();
           // driverPool.get().manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);

        }

        return driverPool.get();
    }

    /**
     *
    This method will make sure our driver value is always null after using quit() method.
    because to create driver object we use Singleton design pattern. This pattern demands to us driver to be "null"
    otherwise that method can not run. To make our driver "null" again, right after closing it by using quit() or close()
    method we need one more method. In this way we are able to run every single test from scratch.
     */
    public static void closeDriver(){
        if ( driverPool.get() != null ){
            driverPool.get().quit();
            driverPool.remove();
        }
    }

}
