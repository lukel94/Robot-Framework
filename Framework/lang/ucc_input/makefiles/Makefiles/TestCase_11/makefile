# this is the source folder 
src_dir=source

# this is the deploy folder
deploy_dir=mockups

# scripts dir
js_dir=$(src_dir)/assets/js

# html
html_files := $(notdir $(wildcard $(src_dir)/*.html))

# If using CSS instead of SASS
css_dir=$(src_dir)/assets/css
CSS=bootstrap.css 
exception_css= ie.css

# script files
scripts = main.js
exception_js = jquery.min.js iefixes.min.js

compile: init setup css html minjs exceptionjs languagejs exceptioncss copycontent

setup:
	@curl http://code.jquery.com/jquery.min.js 																-o $(src_dir)/assets/js/jquery.min.js

	@curl https://raw.github.com/aFarkas/html5shiv/master/dist/html5shiv.js 	-o $(src_dir)/assets/js/iefixes.js
	@curl https://raw.github.com/scottjehl/Respond/master/respond.min.js 			>> $(src_dir)/assets/js/iefixes.js

	@uglifyjs -c --output $(src_dir)/assets/js/iefixes.min.js $(src_dir)/assets/js/iefixes.js
	@rm $(src_dir)/assets/js/iefixes.js

	#
	# Bootstrap JavaScript files. Include specific files for smaller files
	#
	#@curl http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js 									>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/tab.js 															>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/affix.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/alert.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/button.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/carousel.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/collapse.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/dropdown.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/modal.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/popover.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/scrollspy.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/tooltip.js 														>> $(src_dir)/assets/js/plugins.js
	#@curl https://raw.github.com/twbs/bootstrap/master/js/transition.js 														>> $(src_dir)/assets/js/plugins.js

	@curl http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js 							-o $(src_dir)/assets/js/plugins.js
	@curl http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js 									>> $(src_dir)/assets/js/plugins.js
	@curl http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js 				>> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/imulus/retinajs/master/src/retina.js 												>> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/davatron5000/FitVids.js/master/jquery.fitvids.js							>> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/woothemes/FlexSlider/master/jquery.flexslider-min.js 				>> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/stephband/jquery.event.move/master/js/jquery.event.move.js 	>> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/stephband/jquery.event.swipe/master/js/jquery.event.swipe.js >> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/tuupola/jquery_lazyload/master/jquery.lazyload.min.js 				>> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/carhartl/jquery-cookie/master/jquery.cookie.js 							>> $(src_dir)/assets/js/plugins.js
	@curl https://github.com/ftlabs/fastclick/blob/master/lib/fastclick.js 										>> $(src_dir)/assets/js/plugins.js
	@curl https://raw.github.com/Julienh/Sharrre/master/jquery.sharrre.min.js 								>> $(src_dir)/assets/js/plugins.js

	@uglifyjs -c --output $(src_dir)/assets/js/plugins.min.js $(src_dir)/assets/js/plugins.js
	@rm $(src_dir)/assets/js/plugins.js

init:
	@echo "-------------------------------------------------------------------\n"
	@echo "                          Compiling...\n"
	@echo "-------------------------------------------------------------------\n"
	@mkdir -p $(deploy_dir)

copycontent:
	@mkdir -p $(deploy_dir)/assets/fonts
	@mkdir -p $(deploy_dir)/assets/img

	@cp -r $(src_dir)/assets/fonts/ $(deploy_dir)/assets/fonts/
	@cp -r $(src_dir)/assets/img/ $(deploy_dir)/assets/img/

html:
	@mkdir -p $(deploy_dir)/
	@for f in $(html_files); do \
		(cat $(src_dir)/inc/header.html $(src_dir)/$$f $(src_dir)/inc/footer.html > $(deploy_dir)/$$f ) || exit; \
	done	

css:
	@mkdir -p $(deploy_dir)/assets/css
	@for f in $(CSS); do \
		(cat $(css_dir)/$$f >> $(deploy_dir)/assets/css/styles.css) || exit; \
	done	
	
	@recess --compress $(deploy_dir)/assets/css/styles.css > $(deploy_dir)/assets/css/styles.min.css
	@rm $(deploy_dir)/assets/css/styles.css

# Concat all javascript into one single file.
concatjs:
	@mkdir -p $(deploy_dir)/assets/js
	@for f in $(scripts); do \
		(cat $(js_dir)/$$f >> $(deploy_dir)/assets/js/main.js) || exit; \
	done	

# Minify the concated JS file
minjs:
	@make concatjs
	@uglifyjs -c --output $(deploy_dir)/assets/js/main.min.js $(deploy_dir)/assets/js/main.js
	@rm $(deploy_dir)/assets/js/main.js

#These JS are exceptions and cannot be minified with the others
exceptionjs:
	@for f in $(exception_js); do \
		(cp $(js_dir)/$$f $(deploy_dir)/assets/js/) || exit; \
	done	

languagejs:
	@mkdir -p $(deploy_dir)/assets/js/locale
	@for f in $(language_js); do \
		(cp $(js_dir)/locale/$$f $(deploy_dir)/assets/js/locale/) || exit; \
	done	

exceptioncss:
	@for f in $(exception_css); do \
		(cp $(css_dir)/$$f $(deploy_dir)/assets/css/) || exit; \
	done	

clean:
	@rm -r $(deploy_dir)
