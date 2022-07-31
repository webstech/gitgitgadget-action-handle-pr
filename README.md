<!-- start title -->

# gitgitgadget Action: gitgitgadget-action-handle-pr

<!-- end title -->
<!-- start description -->

This is a GitHub action to process pull request creates, updates and comments with gitgitgadget. It is used as a workflow dispatch action running in a separate repo. The use case is for repos that will not allow complex github actions in the codebase when the github repo is a clone that is used to submit updates to a non-GitHub maintained repo.

<!-- end description -->
<!-- start contents -->
<!-- end contents -->
<!-- start usage -->

```yaml
- uses: gitgitgadget/gitgitgadget-action-handle-pr@v0.5.0
  with:
    # A repository scoped GitHub Personal Access Token.
    token: ""

    # The location of the repository.
    repository-dir: ""

    # The location of the repository with gitgitgadget configuration information.
    config-repository-dir: ""

    # JSON configuration for commands.
    config: ""

    # Repository owner.
    repo-owner: ""

    # Repository name.
    repo-name: ""

    # Repository pull target.
    repo-baseowner: ""

    # Pull request number.
    pull-request-number: ""

    # Comment id for handling comments.
    comment-id: ""

    # Value of 'push' or 'comment'
    action: ""

    # Do not update remotes (for testing only)
    skip-update: ""
```

<!-- end usage -->
<!-- start inputs -->

| **Input**                   | **Description**                                                             | **Default** | **Required** |
| --------------------------- | --------------------------------------------------------------------------- | ----------- | ------------ |
| **`token`**                 | A repository scoped GitHub Personal Access Token.                           |             | **true**     |
| **`repository-dir`**        | The location of the repository.                                             |             | **true**     |
| **`config-repository-dir`** | The location of the repository with gitgitgadget configuration information. |             | **true**     |
| **`config`**                | JSON configuration for commands.                                            |             | **true**     |
| **`repo-owner`**            | Repository owner.                                                           |             | **true**     |
| **`repo-name`**             | Repository name.                                                            |             | **true**     |
| **`repo-baseowner`**        | Repository pull target.                                                     |             | **true**     |
| **`pull-request-number`**   | Pull request number.                                                        |             | **true**     |
| **`comment-id`**            | Comment id for handling comments.                                           |             | **false**    |
| **`action`**                | Value of 'push' or 'comment'                                                |             | **true**     |
| **`skip-update`**           | Do not update remotes (for testing only)                                    |             | **false**    |

<!-- end inputs -->
<!-- start outputs -->
<!-- end outputs -->
<!-- start [.github/ghdocs/examples/] -->
<!-- end [.github/ghdocs/examples/] -->
## Contributing
The current tests are Windows based.

### Using a local `gitgitgadget`
This action is a thin layer that uses [gitgitgadget](https://github.com/gitgitgadget/gitgitgadget)
for most of the processing.  If you have local changes to `gitgitgadget` that need to be
tested:
1. In the `gitgitgadget` project run `npm pack` to generate an installable package.  By default,
the package will be located in the root directory of the project.  This can be changed by
specifying `--pack-destination=` on the command.
2. Change the `package.json` to point to the `tgz` packaage file and run `npm install gitgitgadget`.

### action.yml changes
Changes to `action.yml` require regenerating the `README.md`. This is done using `docker`.  If it
is not available it should be installed.  The `README.md` is updated using `npm run build:readme`.
**Note**: markup is very limited in the `action.yml`.

### Source Changes
The action is built using `npm run build`.  This builds a standalone runnable at `dist/index.js`.

### Testing
See the `package.json` scripts.
### Make a pull request
First, if there are related `gitgitgadget` changes, that pull request should be done first.  A fresh
install, build and test should be done using the unmodified `package.json`.

`npm version` may need to be done based on the level of change.  If this is done, make sure the
tags get pushed to GitHub.

The patch series will need to include the `dist/index.js`.

## TODO
A separate action will be developed to rebuild the `dist/index.js` as needed when updates to
`gitgitgadget` have been made.
