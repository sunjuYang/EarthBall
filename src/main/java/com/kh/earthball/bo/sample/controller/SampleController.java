package com.kh.earthball.bo.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleController {

  @GetMapping("admin")
  public String sample() {
    return "bo/dashboard/dashboard";
  }

}
