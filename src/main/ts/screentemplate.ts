import Vue from 'vue';
import BaseVueJS from './vuelib';
import Component from 'vue-class-component'
import { BeanTemplate } from './jsweet/ts/io/github/myusername/apptemplate/db/BeanTemplate';

@Component
class ScreenTemplate extends BaseVueJS {
	beantemplates : BeanTemplate | null = null;

	mounted() {
		this.load();
	}

	load() {
		var input = {
			id: 1
		}
		this.callApi('/apis/beantemplate/all', input).then((result:BeanTemplate) => {
			this.beantemplates = result;
			this.$nextTick(this.showMain);
		});
	}

	showMain() {
		(<HTMLElement>this.$refs.mainContent).classList.remove('is-hidden');
	}
};

window.onload = function() {
	new ScreenTemplate({
		el: '#mainContent'
	});
};

