package commons;

import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.net.MalformedURLException;
import java.net.URL;

public class MobileDriver {
    public static AndroidDriver<MobileElement> driver;

    public static void initialize() throws MalformedURLException {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("platformName", "Android");
        caps.setCapability("deviceName", "AndroidDevice");
        caps.setCapability("automationName", "UiAutomator2");
        caps.setCapability("browserName", "Chrome");

        driver = new AndroidDriver<>(new URL("http://127.0.0.1:4723/wd/hub"), caps);
    }

    public static void quit() {
        if (driver != null) {
            driver.quit();
        }
    }
}
