
# Trufflehog Actions Scan :pig_nose::key:

Scan recent commits in repository for secrets with basic [trufflehog](https://github.com/dxa4481/truffleHog) defaults in place for easy setup.

This action is intended as a Continuous Integration secret scan in an already "clean" repository. The default commit scan depth is the last 50 commits and can be adjusted using Custom Arguments (see below).

It is recommended to run a basic trufflehog scan on your entire repository prior to relying on this CI solution (Note: this can be done manually from the command line or by using this action with custom options `"--regex --entropy=False"`).

## Usage

```txt

- name: trufflehog-secret-check
  uses: mesahil-cloud/trufflehog-secret-check@main
  with:
    scanArguments: "--allow truffleHog/allow.json --regex --entropy False --max_depth 1"

```

Default trufflehog options for this tool include:

- regex : Enable high signal regex checks

- entropy disabled: Disabled entropy checks

- max depth is 50: The max commit depth to go back when searching for secrets

For custom regex rules:

- rules: Uses custom [regexes.json](regexes/regexes.json)
  - Note: this is similar to the default `trufflehog` version, however this `regexes.json` will catch some additional API keys including any key Encapsulation Boundary that ends in ` PRIVATE KEY-----` or ` PRIVATE KEY BLOCK-----`.

Edit your corresponding actions `yml` file or create a new one.

### Basic

```yaml
steps:
- uses: actions/checkout@master
- name: trufflehog-secret-check
  uses: mesahil-cloud/trufflehog-secret-check@main
```

### Custom Arguments

```yaml
steps:
- uses: actions/checkout@master
- name: trufflehog-secret-check
  uses: mesahil-cloud/trufflehog-secret-check@main
  with:
    scanArguments: "--regex --entropy=False --max_depth=5 --rules /regexes.json" # Add custom options here*

```

*if custom options argument string is used, it will overwrite default settings
*if you want to just run the `trufflehog` command with NO arguments, set as a single spaced string `" "`

----

[MIT License](LICENSE)
