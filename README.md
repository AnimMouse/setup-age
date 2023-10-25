# Setup age for GitHub Actions
Setup [age](https://age-encryption.org) on GitHub Actions to use `age`.

This action installs [age](https://age-encryption.org) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

## Usage
To use `age`, run this action before `age`.

### Encrypt file
```yaml
steps:
  - name: Setup age
    uses: AnimMouse/setup-age@v1
    
  - run: age -r age1heyeacwyv3jts97285vf7ksjczs2ple2fpf5uxghm993332pvv6sa5s8m5 -o file.txt.age file.txt
```

### Decrypt file
Paste your age secret key to `AGE_SECRET_KEY` secret and use process substitution on the identity input.

```yaml
steps:
  - name: Setup age
    uses: AnimMouse/setup-age@v1
    
  - run: age -d -i <(echo $AGE_SECRET_KEY) -o file.txt file.txt.age
    env:
      AGE_SECRET_KEY: ${{ secrets.AGE_SECRET_KEY }}
```

### Generate a key pair
```yaml
steps:
  - name: Setup age
    uses: AnimMouse/setup-age@v1
    
  - run: age-keygen
```

### Specific version
You can specify the version you want. By default, this action downloads the latest version if version is not specified.

```yaml
steps:
  - name: Setup age
    uses: AnimMouse/setup-age@v1
    with:
      version: v1.1.1
```

### GitHub token
This action automatically uses a GitHub token in order to authenticate with GitHub API and avoid rate limiting. You can also specify your own read-only fine-grained personal access token.

```yaml
steps:
  - name: Setup age
    uses: AnimMouse/setup-age@v1
    with:
      token: ${{ secrets.GH_PAT }}
```

#### Similar actions
1. [alessiodionisi/setup-age-action](https://github.com/alessiodionisi/setup-age-action)
2. [jacobsvante/setup-age-action](https://github.com/jacobsvante/setup-age-action)
3. [jacobsvante/age-decrypt-action](https://github.com/jacobsvante/age-decrypt-action)