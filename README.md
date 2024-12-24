An experimental Quarto project for entertaining kids at New Year.  

## Traditional approach

Every New Year we host a balloon pop party for our kids.  Traditionally we write out a series of fun games and tasks on small pieces of paper and place each inside a balloon (tip - roll paper up, insert in balloon and then blow up).  We then write an hour of the evening on each balloon and, at that time, the kids pop the balloon and get a fun surprise.

## Quarto approach

New approach: each balloon has a QR Code which points to a quarto blog page.  Much more fun!  Plus you can update without having to get inside a balloon.😄 

## This repo

This repo contains a simple Quarto website with a few examples of how to use.  The `posts` folder contains one entry per balloon.  Simply edit/amend as you see fit.  There are two games (charades and tongue-twisters) built as Quarto shortcodes, described below.  
Once rendered, the Quarto site includes a QRcodes page, holding QR codes which points to each blog entry.  Print this page, cut out the QR codes and insert one in each balloon.  At the specified time pop the balloon, scan the QR code and enjoy!  We find that this keeps kids amused throughout the evening!

### How to use

-  Clone the repo.
-  **Important:** update `site-url` in `_quarto.yml` to point to the site where you'll be hosting (this is used to build the QR codes).
-  Render the site using `quarto render`.  This builds the site in the `docs` folder.  The following R packages are needed to build the QR codes: {yaml}, {rmarkdown}, {qrcode}.
-  Push to GitHub repo and follow instructions under https://quarto.org/docs/publishing/github-pages.html#render-to-docs to configure the GitHub repo to publish from the `docs` directory of the `main` branch.

Example available at https://harveyl888.github.io/newyear/


## Shortcodes

### Charades
The charades shortcode adds a button which, when clicked, shows a random charade to act out.

Add the following to the yaml header:
```yaml
charades:
  movies:
    - name of movie
    - name of movie
    ...
  songs:
    - name of song
    - name of song
    ...
```

and include the following in the page text:

```
{{< charades >}}
```

### Tongue Twisters
The tonguetwister shortcode adds a button which, when clicked, shows a random charade to act out.

Add the following to the yaml header:
```yaml
tonguetwisters:
  - tonguetwister
  - tonguetwister
  ...
```

and include the following in the page text:

```
{{< tonguetwisters >}}
```
