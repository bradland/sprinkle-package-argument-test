# Sprinkle Package Argument Test

## Overview

This repository is a simple set of [Sprinkle][1] scripts for testing the hand-off of params to packages when required by a policy. Specifically, I'm trying to do something like this in my policy:

     requires :stub, :information => 'it worked'

The desire is to have the hash passed in the second argument available within the Package that is required.

I thought this should work because of the magic in [ArbitraryOptions][2] which is included in [Package][3], but sadly, I'm not that smart, so I'm having a difficult time understanding this. Based on the example policy in the Sprinke README, it looks like it should work:

    policy :rails, :roles => :app do
      requires :rails, :version => '2.1.0'
      requires :appserver
      requires :database
      requires :webserver
    end

In this example, version is passed to the rails package.

Maybe you can help! If think you can, please clone this repo and try out the following steps. If you have any insights for me, I'd love to hear them! You can open an issue in this repo, or you can ping me on Twitter ([@bradleyland](https://twitter.com/#!/bradleyland)).

1. Boot a test VM and set up ssh-keypair login so Capistrano will work unabated
2. Edit deploy.rb with your test server IP address
3. Install the bundle (you might want to create a gemset)
4. Invoke `sprinkle -s 0-test.rb` in your shell
5. Observer failure
6. WHY, OH WHY, CAN'T I HAVE NICE THINGS!?

## I'd love to help, but what the hell is Sprinkle

You could always have a look at the [Sprinkle repo][1], but here's a blurb explanation:

> Sprinkle is a declarative DSL for provisioning remote systems. You specify a list of packages - which are defined using the Sprinkle DSL - to install, and then invoke something like `sprinkle -s my-script.rb` on your local system. Sprinkle deploys the pacakges by building a list of shell commands that will be executed against the remote system. You could think of Sprinkle as a DSL for constructing shell commands, that are then executed against a remote system.

## Orientation - What's in the files

In order of importance... sort of.

File `deploy.rb`:

This contains the Capistrano configuration. Capistrano is one mechanism Sprinkle can use to execute commands on the remote server.

File `0-test.rb`:

This file contains the Policy. Policies are lists of packages that will be deployed to the target.

File `packages/stub.rb`

This is the test package. Packages utilize [Installers][4], of which there are many available for accomplishing common tasks.

File `helper.rb`

Loads all the packages.

File `Gemfile`

Includes all the gems needed to run Sprinkle.

[1]: https://github.com/crafterm/sprinkle
[2]: https://github.com/crafterm/sprinkle/blob/master/lib/sprinkle/extensions/arbitrary_options.rb
[3]: https://github.com/crafterm/sprinkle/blob/master/lib/sprinkle/package.rb
[4]: https://github.com/crafterm/sprinkle/blob/master/lib/sprinkle/installers/installer.rb
