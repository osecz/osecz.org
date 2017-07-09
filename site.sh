# User Code.

# Configuration.
site_author="Susam Pal"

# Setup staging directory.
mkdir _site
cp -r static/* _site

# User functions.

title()
{
    if [ -z "$post_title" ]
    then
        printf "OSECZ - Open Security Zone"
    else
        printf "%s - OSECZ" "$post_title"
    fi
}

out()
{
    printf "%s" "$*"
}

SNIP_LEN=50
render_blog content/blog "*.html" template/blog.html /blog
render_blog content/pages "*.html" template/base.html /
mv "$SITE_DIR/home/index.html" "$SITE_DIR/index.html"
rm -rf "$SITE_DIR/home"
