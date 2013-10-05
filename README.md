# PlugAuth::Plugin::AuthenSimple

AuthenSimple plugin for PlugAuth

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

This plugin allows any [Authen::Simple](http://search.cpan.org/perldoc?Authen::Simple) implementation to be used as an 
authentication mechanism for [PlugAuth](http://search.cpan.org/perldoc?PlugAuth).  Because [Authen::Simple](http://search.cpan.org/perldoc?Authen::Simple) 
does not provide a user list, neither does this plugin, so you will need 
to maintain a list of users, perhaps using the 
[PlugAuth::Plugin::FlatUserList](http://search.cpan.org/perldoc?PlugAuth::Plugin::FlatUserList) plugin.

# SEE ALSO

[PlugAuth](http://search.cpan.org/perldoc?PlugAuth), [Authen::Simple](http://search.cpan.org/perldoc?Authen::Simple)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
