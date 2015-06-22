#SFU CODE CSS/JS Framework

[sfucode/sfucode.github.io](https://github.com/sfucode/sfucode.github.io)

1. **develop** branch - to test on canvas-test
1. **master** branch - for production canvas
1. use [git-flow workflow](http://danielkummer.github.io/git-flow-cheatsheet/) for releases



##A workaround repo for canvas-test

[Diliara/sfucode.github.io](https://github.com/Diliara/sfucode.github.io/tree/gh-pages)

1. When repo server is out of service, this fork can be used.
1. Update URL include on canvas-test + hardcoded URL in code-canvas.coffee
1. **gh-pages** branch is used to test on canvas-test
1. push final changes ready for the *pull request* to **develop** branch
1. ignore **master** branch for canvas-test, but sync it to keep up-to-date with the upstream repo.

