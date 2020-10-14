require 'Selenium-Webdriver'

$driver = Selenium::WebDriver.for :chrome

at_exit do 
    $driver.quit
end