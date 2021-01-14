package io.github.myusername.apptemplate.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/", produces = { "text/html; charset=UTF-8" })
public class AppTemplateController {
	@RequestMapping("/")
	public String home() {
		return "redirect:/screentemplate";
	}

	@RequestMapping("/screentemplate")
	public String screentemplate() {
		return "screentemplate";
	}

}
