# How to create a new release

Create a new git tag locally using:

```bash
git tag $TAG_NAME
```

The tag name should correspond to the current version of the project. It must start with `v` for the
proper github actions to kick in; e.g. `v0.1.12`.

Then push it to the remote with:

```bash
git push --tags
```

Wait for it to build. Then go to the
[Github releases page](https://github.com/hocus-dev/cli/releases), click edit on the new draft, and
publish it.
