package Regexp::Pattern::Perl::Module;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
#use warnings;

our %RE = (
    perl_modname => {
        pat => '[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*',
        examples => [
            {str=>'', anchor=>1, matches=>0},
            {str=>'Foo::Bar', anchor=>1, matches=>1},
            {str=>'Foo::0Bar', anchor=>1, matches=>1},
            {str=>'0Foo::Bar', anchor=>1, matches=>0},
            {str=>'Foo/Bar', anchor=>1, matches=>0},
        ],
    },
    perl_modname_with_optional_args => {
        pat => '[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*(?:=.*)?',
        examples => [
            {str=>'', anchor=>1, matches=>0},
            {str=>'Foo::Bar', anchor=>1, matches=>1},
            {str=>'Foo::0Bar', anchor=>1, matches=>1},
            {str=>'0Foo::Bar', anchor=>1, matches=>0},
            {str=>'Foo/Bar', anchor=>1, matches=>0},

            {str=>'Foo::Bar=', anchor=>1, matches=>1},
            {str=>'Foo::Bar=a', anchor=>1, matches=>1},
            {str=>'Foo::Bar=a,b,c', anchor=>1, matches=>1},
            {str=>'Foo::Bar=a=1', anchor=>1, matches=>1},
            {str=>'=Foo::Bar', anchor=>1, matches=>0},
        ],
    },
);

1;
# ABSTRACT: Regexp patterns related to Perl modules

=head1 prepend:SEE ALSO

Other C<Regexp::Pattern::Perl::*> modules.
