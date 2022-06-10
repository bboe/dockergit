# Docker and Git Unsafe Repository Issue on MacOS

I encountered the following odd issue this week and took steps to reproduce.

## Environment

I am running:

- macOS Monterey 12.4
- Docker Desktop 4.9.0 (80466)
- Docker Engine: 20.10.16

I've been told the bug is not reproducible on Linux, thus it likely only impacts Docker on Mac.

I have also verified that the problem does _not_ exist if the "Enable VirtioFS accelerated directory sharing" experimental feature is enabled. However, the problem _does_ exist regardless of the "Use the new Virtualization framework" experimental feature being enabled or not (assuming VirtioFS is not enabled).


## Steps to Reproduce

```sh
git clone https://github.com/bboe/dockergit.git
cd dockergit
./run.sh
```

At this point you will have a shell in the container. Run `git status` and you might see the following:

```text
/a $ git status
fatal: unsafe repository ('/a' is owned by someone else)
To add an exception for this directory, call:

    git config --global --add safe.directory /a
```

Here's where it becomes interesting. Simply run `ls` and then re-run `git status` and it should work as expected:

```text
a/ $ ls
Dockerfile     README.md      run.sh
/a $ git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```
