Given('user go to tiki.vn') do
    $driver.get "https://tiki.vn/"
  end
  
  When('user search and add to cart') do
    
    $driver.find_element(css: ".eUnWAD").send_keys("apple")
    
    $driver.find_element(css: ".ieXBRV").click

    $driver.find_element(css: ".checkbox.is-tikinow").click

    $driver.manage.timeouts.implicit_wait = 4

    $driver.find_element(css: ".apply-btn").click

    tinh_thanhpho = $driver.find_element(:css, "div.col-xs-6 > select.form-control")
    select_tinhtp = Selenium::WebDriver::Support::Select.new(tinh_thanhpho)
    select_tinhtp.select_by(:text, "Hà Nội")

    $driver.manage.timeouts.implicit_wait = 3

    quan_huyen = $driver.find_element(:css, "div.form-group:nth-child(2) div.col-sm-6 > select.form-control")
    select_quanhuyen = Selenium::WebDriver::Support::Select.new(quan_huyen)
    select_quanhuyen.select_by(:text, "Quận Hai Bà Trưng")

    $driver.manage.timeouts.implicit_wait = 3

    phuong_xa = $driver.find_element(:css, "div.form-group:nth-child(3) div.col-sm-6 > select.form-control")
    select_phuongxa = Selenium::WebDriver::Support::Select.new(phuong_xa)
    select_phuongxa.select_by(:text, "Phường Lê Đại Hành")

    $driver.find_element(:css, "button.apply-btn").click

    $driver.find_element(:css, "div:nth-child(17) > a > div.content").click

    title = $driver.find_element(:css, "h1.title:nth-child(1)").text
    if title== "Bao case silicon cho tai nghe Apple Airpods / Earpods - Hàng nhập khẩu"
        $driver.find_element(:css, "div.group-input > button:nth-child(3)").click
        $driver.find_element(:css, "button.btn.btn-add-to-cart").click
        $driver.find_element(:css, "div.Userstyle__Item-sc-6e6am-1.dFYIFY > span.Userstyle__ItemText-sc-6e6am-2.gGRKbG").click

        sleep 5
    else $driver.quit
    end
  end
  
  Then('user recheck items in cart') do     

    count_items = $driver.find_element(:css, "div > h2 > span").text
    expect(count_items).to include("2 sản phẩm")
    
    price_check = $driver.find_element(:css, "span.prices__value.prices__value--final").text
    expect(price_check).to include("58.000")

  end