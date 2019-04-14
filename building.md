# Building the Blog

## Build the Docker Image

```bash
$ docker-compose build
```

## Install the `hugo-future-imperfect` theme

Author: Julio Pescador

[Theme Site](https://themes.gohugo.io/future-imperfect/)

```bash
mkdir src/themes
cd src/themes
git clone https://github.com/jpescador/hugo-future-imperfect.git
```

## Adding the deployment folder

The compiled site is built by Hugo in the `./public` directory. This directory sits within a separate repository to take advantage of GitHub Pages hosting.

One time only, when setting your local repository up, you need to create the public folder as a git submodule, so it maps to a different origin repository.

```bash
rm -rf ./public/
git submodule add -b master githubhonir:matbrunt/matbrunt.github.io.git public
```

## Deploying Changes

Every time you build a new compiled version of the site, the content will be placed in the `./public` folder.

Changes in this folder can be added and committed through the normal git process, then pushed to origin.

Because this is a git submodule, when you push changes, they will be pushed to the repository containing the compiled version of the site.

```bash
make compile
cd public
git add ...
git commit -m "" ...
git push origin master
```
