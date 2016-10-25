#!/usr/bin/env perl

package SomeModule {

	sub say_hello {
		my ($self) = @_;

		print "Hello, my name is ".$self->name."\n";
	}

	sub new {
		my (%args) = @_;

		my $self = {
			name=>%args{name}
		};

		return bless($self,'SomeModule');
	}

}

my $person = SomeModule->new(name=>"Loïc");

# no-op
my $unnecessary_calculation = 1+20*3;

$person->say_hello;
