cat lighttpd.conf|sed 's;server.document-root.*;server.document-root = '"\"$(pwd)\""';'>lighttpd.conf.tmp
echo '<html><head><title>FASTQC_SCORES</title></head><body>'>index.html.tmp
if ls *.html&>>/dev/null;then
    for fn in *.html;do
	echo '<p><a href='"\"${fn}\""'>'"${fn}"'</a></p>'>>index.html.tmp
    done
fi
echo '</body></html>'>>index.html.tmp
mv index.html.tmp index.html
lighttpd -D -f lighttpd.conf.tmp
rm -f lighttpd.conf.tmp
