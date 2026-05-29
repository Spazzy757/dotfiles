# Coding

1. Don't assume; surface tradeoffs
2. Minimum code, nothing speculative
3. Touch only what's needed
4. Define success criteria, loop until verified

# Git

- Rebase only, no merge commits
- One commit per PR, amend to keep it single
- Conventional commits with a descriptive body
- PR body matches commit body
- Never commit to main/master; always PR

# Kubernetes

- Always use `--kubeconfig` and `--context` explicitly
- Verify before changing any cluster with "prod" in the name
- Never delete volumes or PVCs without explicit permission
