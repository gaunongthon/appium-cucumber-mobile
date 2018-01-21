module UtilFunctions

  def create_getters
    begin
      instance_variables.each do |v|
        define_singleton_method(v.to_s.tr('@','')) do
          instance_variable_get(v)
        end
      end
    rescue
      "Element not yet found"
    end
  end

  def mouseOver(element)
    element.fire_event "onmouseover"
  end

  def scrollElementToCenter(element)
    element.scroll.to :center
  end

  def sendKeys(element, text)
      element.send_keys text
  end

  def clickElement(element)
      element.click
      sleep(WAIT_DEFAULT)
  end

  def doubleClickElement(element)
    element.double_click
    sleep(WAIT_DEFAULT)
  end

  def clickElementNoWait(element)
      element.click
  end

  def getElementAttr(elememt, attr)
    case attr
      when "class"
        elememt.attribute_value("class")
    end
  end
end
