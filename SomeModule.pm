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

		bless($self,'SomeModule');

		return $self;
	}

}

1;
