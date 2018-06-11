all: index full

index: $(patsubst %.md,%.html,$(wildcard *.md))
	cat *.md | awk '/##/ { print "<div><a href=\"" $$2 "html\">" $$0 "</a></div>" }' >toc.html.in
	cat index-header.html.in toc.html.in index-footer.html.in >index.html

full: $(patsubst %.md,%.html,$(wildcard *.md))
	pandoc --from markdown --to html5 --standalone --toc -o full.html *.md

%.html: %.md
	pandoc --from markdown --to html5 --standalone -i $^ -o $@
