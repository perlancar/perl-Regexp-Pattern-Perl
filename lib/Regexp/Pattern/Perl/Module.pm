package Regexp::Pattern::Perl::Module;

# AUTHORITY
# DATE
# DIST
# VERSION

our %RE = (
    perl_modname => {
        pat => '\A[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*\z',
        examples => [
            {str=>'', matches=>0},
            {str=>'Foo::Bar', matches=>1},
            {str=>'Foo::0Bar', matches=>1},
            {str=>'0Foo::Bar', matches=>0},
            {str=>'Foo/Bar', matches=>0},
        ],
    },
    perl_modname_with_optional_args => {
        pat => '\A[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*(?:=.*)?\z',
        examples => [
            {str=>'', matches=>0},
            {str=>'Foo::Bar', matches=>1},
            {str=>'Foo::0Bar', matches=>1},
            {str=>'0Foo::Bar', matches=>0},
            {str=>'Foo/Bar', matches=>0},

            {str=>'Foo::Bar=', matches=>1},
            {str=>'Foo::Bar=a', matches=>1},
            {str=>'Foo::Bar=a,b,c', matches=>1},
            {str=>'Foo::Bar=a=1', matches=>1},
            {str=>'=Foo::Bar', matches=>0},
        ],
    },
);

1;
# ABSTRACT: Regexp patterns related to Perl modules

=head1 SEE ALSO

Other C<Regexp::Pattern::Perl::*> modules.
