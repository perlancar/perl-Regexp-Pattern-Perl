package Regexp::Pattern::Perl::Release;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
#use warnings;

our %RE = (
    perl_release_archive_filename => {
        summary => 'Proper filename of a typical distribution release archive (tarball/zip)',
        pat => qr/([A-Za-z_][A-Za-z0-9_]*(?:-[A-Za-z0-9_][A-Za-z0-9_]*)*)-
                  v?([0-9]+(?:\.[0-9]+){0,4}(?:_[0-9]+|-TRIAL)?)
                  \.(tar|tar\.(?:Z|gz|bz2|xz)|zip|rar)/x,
        tags => ['capturing'],
        examples => [
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent-2000-0.001.tar.gz', gen_args=>{-anchor=>1}, matches=>1},
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent-2000-v0.001.tar.gz', gen_args=>{-anchor=>1}, matches=>1, summary=>'v prefix before version number allowed'},
            {str=>'0.001.tar.gz', gen_args=>{-anchor=>1}, matches=>0, summary=>'No distribution name'},
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent-2000.tar.gz', gen_args=>{-anchor=>1}, matches=>1, summary=>'Unfortunately, numeric namespace name gets mistaken as version number'},
            {str=>'Acme-CPANModulesBundle-Import-PerlAdvent.tar.gz', gen_args=>{-anchor=>1}, matches=>0, summary=>'No version number'},
        ],
    },
);

1;
# ABSTRACT: Regexp patterns related to Perl release

=head1 prepend:SEE ALSO

Other C<Regexp::Pattern::Perl::*> modules.
