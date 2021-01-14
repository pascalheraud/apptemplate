package io.github.myusername.apptemplate.db;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("apptemplate_templatebean")
public class BeanTemplate {

	@Id
	public Long id;

	public String name;
}
