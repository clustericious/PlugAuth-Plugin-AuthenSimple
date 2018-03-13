# PlugAuth::Plugin::AuthenSimple [![Build Status](https://secure.travis-ci.org/clustericious/PlugAuth-Plugin-AuthenSimple.png)](http://travis-ci.org/clustericious/PlugAuth-Plugin-AuthenSimple)

(Deprecated) AuthenSimple plugin for PlugAuth

# SYNOPSIS

PlugAuth.conf:

    ---
    plugin:
      - PlugAuth::Plugin::AuthenSimple:
          - Authen::Simple::PAM:
              service: login
          - Authen::Simple::SMB:
              domain: DOMAIN
              pdc: PDC

# DESCRIPTION

**NOTE**: This module has been deprecated, and may be removed on or after 31 December 2018.
Please see [https://github.com/clustericious/Clustericious/issues/46](https://github.com/clustericious/Clustericious/issues/46).

This plugin allows any [Authen::Simple](https://metacpan.org/pod/Authen::Simple) implementation to be used as an 
authentication mechanism for [PlugAuth](https://metacpan.org/pod/PlugAuth).  Because [Authen::Simple](https://metacpan.org/pod/Authen::Simple) 
does not provide a user list, neither does this plugin, so you will need 
to maintain a list of users, perhaps using the 
[PlugAuth::Plugin::FlatUserList](https://metacpan.org/pod/PlugAuth::Plugin::FlatUserList) plugin.

# SEE ALSO

[PlugAuth](https://metacpan.org/pod/PlugAuth), [Authen::Simple](https://metacpan.org/pod/Authen::Simple)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
