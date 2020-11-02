# Your first environment

First, make sure you have installed `hocus` and have all the prerequisites as described
[in the previous section](./installation.md).

### Downloading an environment

Run

```bash
$ hocus get https://github.com/hocus-templates/base hello_world
```

`hocus` will download the `base` environment definition to `~/.hocus/hello_world`. After it's done,
you will be able to open the environment with:

### Opening an environment

```bash
$ hocus open hello_world
```

If everything has gone well, VSCode is now open inside the `hello_world` environment. Any file
change you make in your home folder (`/home/hocus/`) will be preserved between environment restarts.

### Customizing an environment

When you go back to your host machine's terminal, run

```bash
$ hocus edit hello_world
```

VSCode will open in the folder that contains your environment's definition. Let's look at its
components.

> **`docker-compose.yml`**
> 
> It defines every service that will run as part of your environment. You may add more applications
> to it, such as a database. Take note of the `app` service. It's built from the `Dockerfile` that's
> in the environment's folder. It also has the `home` volume; that's what makes the file changes in
> the `/home/hocus/` folder persist.

> **`Dockerfile`**
> 
> It defines what the `app` service is. You will see the
> `FROM hocustemplates/base:latest` directive inside. That image's `Dockerfile` is available in
> [on Github](https://github.com/hocus-templates/base-dockerfile/).

> **`hocus.yml`**
> 
> Contains directives for `hocus` itself. Every field is documented inside.

> **`user_template`**
> 
> This folder is the template from which the `user` folder is generated the first time an
> environment is opened. We generate `user` to allow a user to customize the environment without
> interfering with the git repository.

> **`user`**
> 
> This folder is generated from `user_template` the first time an environment is opened. It is also
> a local git repository, so you can track the local changes you've made.

> **`user/init.sh`**
>
> This script is run by `hocus` only the first time an environment is opened. Here you can put
> your `git clone`s, and other single-run directives required to initialize your development
> environment.

> **`user/shell.sh`**
>
> Here you define the shell that you will use inside your `hocus` environment.

> **`user/build.sh`**
>
> This script is run from the `Dockerfile` as root, so you can extend your environment with tools
> that you and none of your other teammates will use.

> **`user/.env`**
>
> Here you can define the environment variables that you want to be set in your shell. See how this
> file is sourced in `user/shell.sh`.

> **`user/vscode-settings.json`**
>
> These are the settings that will be used by VSCode inside the environment.

> **`user/.hocus-state.yml`**
> 
> This is a `hocus`-managed file that you should ignore.


### Closing an environment

When you are done using an environment for the day, you can shut it down with:

```bash
$ hocus close hello_world
```

It will turn off all services that are defined in `docker-compose.yml`.

### Removing an environment

Once you want to get rid of an environment from your machine, run:

```bash
$ hocus delete hello_world
```

It will delete the environment's folder and delete its Docker volumes.
