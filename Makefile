all: clean site live

site:
	oyster

live:
	mv _live _dead || echo No live site was found.
	mv _site _live
	rm -rf _dead

clean:
	rm -rf _cache _site
