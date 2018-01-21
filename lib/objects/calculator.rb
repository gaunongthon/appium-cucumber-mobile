class Calculator
  include UtilFunctions
  include Nokogiri

  def equal
    $driver.find_element(:id => 'com.android2.calculator3:id/equal')
  end
  def digit9
    $driver.find_element(:id => 'com.android2.calculator3:id/digit9')
  end
  def plus
    $driver.find_element(:id => 'com.android2.calculator3:id/plus')
  end
  def cling_dismiss
    $driver.find_element(:id => 'com.android2.calculator3:id/cling_dismiss')
  end
  def digit5
    $driver.find_element(:id => 'com.android2.calculator3:id/digit5')
  end
  def getResult
    $driver.find_element(:xpath => '//android.widget.EditText[@index=0]')
  end
  def clear
    $driver.find_element(:id => 'com.android2.calculator3:id/clear')
  end
end
