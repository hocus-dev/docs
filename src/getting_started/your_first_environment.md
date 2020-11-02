# Your first environment

First, make sure you have installed `hocus` and have all the prerequisites as described
[in the previous section](./installation.md).

Then run

```bash
$ hocus get https://github.com/hocus-templates/base hello_world
```

`hocus` will download the `base` environment definition to `~/.hocus/hello_world`. After it's done,
you will be able to open the environment with

```bash
$ hocus open hello_world
```

If everything has gone well, VSCode is now open inside the `hello_world` environment. Any file
change you make in your home folder (`/home/hocus/`) will be preserved between environment restarts.

