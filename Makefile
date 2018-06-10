all: index

index: $(patsubst %.md,%.html,$(wildcard *.md))
	cat *.md | awk '/##/ { print "<div><a href=\"" $$2 "html\">" $$0 "</a></div>" }' >toc.html.in
	cat index-header.html.in toc.html.in index-footer.html.in >index.html

%.html: %.md
	pandoc --from markdown --to html5 --standalone -i $^ -o $@
