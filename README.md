# jumpstart-macos
Automate my Mac OS updates

# Initial setup

1. Make sure you have installed `homebrew` on your Mac. Detailed instructions to be found [here]()

2. Make sure you have installed `git`, if it is not installed install via `brew install git`

3. Make sure your Git `user` and `email` are set:

        git config --global user.name <first_name last_name>
        git config --global user.email <your_email>

On new computer you can also set this one up:

        git config --global push.autoSetupRemote true

Show explanation from Git [documentation](https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushautoSetupRemote):

        push.autoSetupRemote

        If set to "true" assume --set-upstream on default push when no upstream tracking exists for the current branch; this option takes effect with push.default options simple, upstream, and current. It is useful if by default you want new branches to be pushed to the default remote (like the behavior of push.default=current) and you also want the upstream tracking to be set. Workflows most likely to benefit from this option are simple central workflows where all branches are expected to have the same name on the remote.
