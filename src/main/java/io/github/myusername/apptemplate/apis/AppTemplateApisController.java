package io.github.myusername.apptemplate.apis;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.github.myusername.apptemplate.db.BeanTemplate;
import io.github.myusername.apptemplate.db.BeanTemplateDAO;

@RestController
@RequestMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
public class AppTemplateApisController {
	@Autowired
	private BeanTemplateDAO beanTemplateDAO;

	@PostMapping(value = "/apis/beantemplate/all")
	public List<BeanTemplate> getAllBeanTemplates() {
		return StreamSupport.stream(beanTemplateDAO.findAll().spliterator(), false).collect(Collectors.toList());
	}
}
