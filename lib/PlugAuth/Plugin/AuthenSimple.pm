package PlugAuth::Plugin::AuthenSimple;

use strict;
use warnings;
use Authen::Simple;
use Role::Tiny::With;

with 'PlugAuth::Role::Plugin';
with 'PlugAuth::Role::Auth';

# ABSTRACT: AuthenSimple plugin for PlugAuth
# VERSION

=head1 SYNOPSIS

PlugAuth.conf:

 ---
 plugin:
   - PlugAuth::Plugin::AuthenSimple:
       - Authen::Simple::PAM:
           service: login
       - Authen::Simple::SMB:
           domain: DOMAIN
           pdc: PDC

=head1 DESCRIPTION

This plugin allows any L<Authen::Simple> implementation to be used as an 
authentication mechanism for L<PlugAuth>.  Because L<Authen::Simple> 
does not provide a user list, neither does this plugin, so you will need 
to maintain a list of users, perhaps using the 
L<PlugAuth::Plugin::FlatUserList> plugin.

=cut

sub init
{
  my($self) = @_;
 
  my $config_list = $self->plugin_config;
  $config_list = [ $config_list ] unless ref($config_list) eq 'ARRAY';
 
  my @simple_list;
  foreach my $item (@$config_list)
  {
    while(my($class, $config) = each %$item)
    {
      eval qq{ require $class };
      die $@ if $@;
      push @simple_list, $class->new(%$config);
    }
  }
  
  $self->{simple} = Authen::Simple->new(@simple_list);
  $self;
}

sub check_credentials
{
  my($self, $user, $pass) = @_;
  return 1 if $self->{simple}->authenticate($user, $pass);
  $self->deligate_check_credentials($user, $pass);
}

1;

=head1 SEE ALSO

L<PlugAuth>, L<Authen::Simple>

=cut
