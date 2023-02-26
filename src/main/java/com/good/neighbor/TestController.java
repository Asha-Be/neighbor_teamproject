package com.good.neighbor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/test")
@Controller
public class TestController {

  @RequestMapping("/fun")
  public String test() {
    
    String test1 = "null";
    return "test";
  }
}
