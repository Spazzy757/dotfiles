# Brendans Coding Preferences

1. Don't assume, Don't hide confusion,Surface tradeoffs
2. Minimum code that solves the issue, nothing speculative
3. Touch only what you must, clean up only your own mess
4. Define success criteria, loop until verified

# Git

- only ever rebase, no merge commits
- ammend to a single commit -> one commit per pr
- commits should follow conventional commits
- Give a good description in the commit body
- PR should always have the same info as the commit body
- never commit directly to main or master branch, always create a PR

# Kubernetes

- be explicit about which cluster you are connected to use `--kubeconfg` and `--context`
- always verify when making changes to clusters that have prod in the name
- never delete volumes or PVC's with explicit permissions

