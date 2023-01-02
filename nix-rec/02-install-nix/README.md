# Installing Nix in a Debian-based Droplet

This is the second video in The Nix recodings series. It follows the first one
where we provision a Debian-based virtual machine using `doctl`. In this video
we install Nix on Debian.


# Transcript

I believe diving into the Nix ecosystem is worth the effort, even though its
reputation for having a steep learning curve is justified.

A great way to get your feet wet is to install Nix on an existing machine,
although you might want to try on a more disposable environment, such as a
short-lived virtual machine.

In this video I install Nix on a brand new Debian system. So let's get one.
Please refer to the previous video for how to do that.

(My name is Thu, and by creating videos such as this one, I hope to lower the
barrier to entry towards the Nix world.)

We'll get an eye shortly on the official Nix install script, but before that,
I'll install curl and xz, which are need by the install script.

The install script also expects to be run by a regular user, not as root, so
let's create such a user.

I also know that it will try to create a /nix directory using sudo, but our
user is not in the sudoers and has no password, and actually I'm reluctant to
let it do anything as root, so I create the directory myself, and give it to
our user.

We've done preparing the system as root, we can now switch to our user.

Normally, the official way to run the script is by piping it to sh, but I will
download it to show its content.

We've done preparing the system as root, we can now switch to our user.



# Setup - Digital Ocean

We need those to run the Nix install script:

```
# apt -y install curl xz-utils
```

Cloud-init stuff:

```
# curl -s http://169.254.169.254/metadata/v1/
# curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/address
```

The script can't be run as root, so we need a user first.

(This is called single-user install mode ?)

See also https://nixos.org/manual/nix/stable/#chap-quick-start

```
# useradd -m -s /bin/bash thu
```

The install script from the tarball will try to use sudo to create the /nix
directory, bu we can also manually create it:

(made by the script if you can run sudo but we can't because we didn't bother
to add our user to sudoers or provide it with a password)

```
# mkdir -m 0755 /nix && chown thu /nix
```

The rest is done as our user `thu`:

```
# su thu
$ cd
```

```
$ # curl -L https://nixos.org/nix/install | sh
$ curl -L https://nixos.org/nix/install -o install-nix.sh
```

```
$ sh install-nix.sh
$ cat /home/thu/.profile
. /home/thu/.nix-profile/etc/profile.d/nix.sh # which is only read by login shells, so not su...
```

We source the file manually, exiting the shell then `su thu` again isn't enough.

```
$ nix --version
nix (Nix) 2.3.10
$ # We have Nix \o/
```

I can set NIX_INSTALLER_NO_MODIFY_PROFILE

This seems no longer the case:

$ nix-shell -p curl
bash: /run/user/0/env-vars: Permission denied
$ TMPDIR=/tmp nix-shell -p curl # seems better

So I have added
. /home/thu/.nix-profile/etc/profile.d/nix.sh
export TMPDIR=/run/user/1000
to .bashrc and created, as root, /run/user/1000 and chown to my user.

Note: it would be nice if the install script could work on a default Debian
install ? Or maybe with just busybox ? Notably use wget instead of curl and
gzip instead of xz ?
