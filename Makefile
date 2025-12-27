PAGES := $(patsubst pages/%.html,public/%.html,$(wildcard pages/*.html))
SCRIPTS := scripts
ASSETS := assets

all: $(PAGES)
	./buildpage pages/index.html
	./buildpage pages/lien.html
	./buildpage pages/projets.html
	./buildpage pages/cv.html



public/%.html: pages/%.html layout/before.html layout/after.html $(SCRIPTS)/buildpage.sh
	@mkdir -p public
	$(SCRIPTS)/buildpage.sh $<


public/:
	mkdir -p public
	cp -r $(ASSETS)/* public/


clean:
	rm -rf public/*


test: all
	python3 -m http.server --directory public 8000
