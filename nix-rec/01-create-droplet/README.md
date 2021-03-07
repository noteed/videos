# Creating a virtual machine with doctl

This is the very first video in The Nix recordings series. This video is not
about Nix per se but provides a nice common ground to install Nix in a next
video: here we use Digital Ocean's `doctl` command-line tool to provision a
virtual machine on their infrastructure.

Visit noteed.com/videos for a transcript of this video, and additional
information.

[View on YouTube](https://www.youtube.com/watch?v=LeasCiM0NRI)


# Transcript

In this video I show how to create a virtual machine in the cloud, then delete
it. I'm using Digital Ocean and their command-line tool, called doctl.

In the next video, I'll install Nix in such a virtual machine, hopefully
replicating the experience of someone new to Nix.

If you plan to re-create what I do in this video, you'll need:

- a Digital Ocean account,
- a public/private SSH key pair (with the public key uploaded to Digital
  Ocean),
- an API access token (mine is set as an environment variable called
  `DIGITALOCEAN_ACCESS_TOKEN`),
- and finally the `doctl` command-line tool itself.

With those few things in place, let's look at the doctl command-line tool.

doctl accepts a `--help` flag to discover its capabilities, which are organized
in subcommands. Each of them also accepts that `--help` flag, and also exposes
sub-subcommands.

And here is the command we use.

Digital Ocean calls their virtual machines "Droplets".

Droplets can be found in the "compute" subcommand. The very first argument will
be the name of our virtual machine.

Here we specify the region where we want our Droplet. Since I'm from Belgium, I
use something close to me. In this case Amsterdam 3.

The virtual machine image we choose is based on a recent Debian.

We can specify the "size" of our Droplet, which means CPUs, memory, and disk.

We can also specify the fingerprint of our SSH keys. Note that the public key
should already be uploaded to Digital Ocean through their web interface so they
can copy it into the newly created virtual machine.

When the command returns, doctl prints some information. In our case we limit
it to some chosen fields. The one we are the most interested in is the IP
address.

Normally, the Digital Ocean API aknowledges the creation request and the doctl
call returns too. Here we use the `--wait` flag to wait until the virtual
machine is actually ready to be used.

This is useful for semi-automated scripts, so that we can SSH into the virtual
machine right away, without polling to check for its availability.

Let's run that "create" command. Normally this takes about 40 seconds. But
since we're in a video, we'll skip that part.

And now we can see, in the output of the doctl command, the IP address of our
brand new virtual machine.

So let's SSH as `root` into that machine.

Since it's the first time we encounter that machine we have to accept its SSH
fingerprint... and that's it, we're in.

We can for instance check what kind of OS we have... and it's indeed a recent
Debian-based system.

Let's quit our SSH session. Normally I'd use a `ctrl-d` shortcut but we'll type
`exit` in full for the video.

And now that we have used our virtual machine, we can delete it, also using the
doctl tool. This ensures we no longer experience the costs associated to that
virtual machine.

This is quite straigthforward: we pass the name of our Droplet and hit enter.

That's it for this video. In the next one, we'll see how we can install Nix.
