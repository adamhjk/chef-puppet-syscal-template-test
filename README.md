Chef/Puppet Template Call Numbers
----

A tweet flew across my view, claiming that Puppet made 8000 less system calls
to render a template than Chef did.

I was pretty sure this wasn't true.

So I wrote the following pretty trivial profiler setup.  In both cases, it's
the smallest form-factor I know how to create with either tool. 

Puppet is run stand-alone (otherwise, you wouldn't see the cost of the template
render at all, client side.) There is a single module in the path, and all it
does is write the file.

Chef is run in solo mode, so that we're not counting the calls we would be
making to the chef server. (Again, it wouldn't have been apples to apples in
that case, since the server would be doing the bulk of the template part of the
work.)

In both cases, the template renders the fqdn of the system you run it on.

Chef wins by 421353 calls 
====

    Cleaning up previous run
    Running puppet
    notice: /Stage[main]/Ocean/File[/tmp/distant.snakes]/ensure: created
    Running chef
    [Tue, 07 Dec 2010 13:26:12 -0800] INFO: Starting Chef Run (Version 0.9.12)
    [Tue, 07 Dec 2010 13:26:12 -0800] INFO: Writing updated content for template[/tmp/distant.ocicats] to /tmp/distant.ocicats
    [Tue, 07 Dec 2010 13:26:12 -0800] INFO: Chef Run complete in 0.066917 seconds
    [Tue, 07 Dec 2010 13:26:12 -0800] INFO: cleaning the checksum cache
    [Tue, 07 Dec 2010 13:26:12 -0800] INFO: Running report handlers
    [Tue, 07 Dec 2010 13:26:12 -0800] INFO: Report handlers complete
    Puppet: 457596
    Chef: 36243
    Number of calls chef wins by: 421353

Don't belive me?

Do it yourself
----

    gem install ruby-prof
    gem install puppet
    gem install chef
    Rake

If you find a bug
----

Send me a pull request - happy to make it more fair, if I screwed something up.
