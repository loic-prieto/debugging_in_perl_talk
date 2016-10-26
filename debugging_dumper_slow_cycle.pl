#!/usr/bin/env perl
### Auxiliary functions. Code is documentation. YOLO ###
sub generate {
	return {
		pets=>[
			{race=>'kitten', age=>0.2, name=>'Obijuan'},
			{race=>'dog', age=>1.5, name=>'Lobo'}
		],
		valuables=>['Virgin Mary Crucifix','Stuffed Emo hipster','Los chichos Vol1'],
		consoles=>[
			{ brand=>'Nintendo',model=>'Switch' },
			{ brand=>'Sony', model=>'PS4'},
			{ brand=>'PC', model=>'Master Race' }
		],
	};
}

my @kitty_keys = ('Kitty','Kitten','Pussy','PussyCat','KittyCat','pup','puppy','mutty','tail_wagger','BooBoo');
sub step1 {
	my $data = shift;
	my $result = $data;
	if(ref($result) eq 'HASH') {
		$result = {};
		while(my ($key,$value) = each(%$data)){
			rand()>0.5?
				$result->{$kitty_keys[rand(@kitty_keys)]} = step1($value):
				$result->{$key} = step1($value);
		}
	} elsif(ref($result) eq 'ARRAY') {
		$result = [];
		for my $item (@$data){
			push @$result,step1($item);
		}
	}

	return $result;
}

use String::CamelCase qw(decamelize);
sub step2 {
	my $data = shift;
	my $result = $data;
	if(ref $data eq 'HASH'){
		$result = {};
		while(my($key,$value) = each(%$data)){
			$result->{decamelize($key)} = step2($value);
		}
	} elsif(ref $data eq 'ARRAY'){
		$result = [];
		for my $item (@$data){
			push @$result,step2($item);
		}
	}

	return $result;
}

use List::Util qw(shuffle); #YOLO
sub step3 {
	my $data = shift;

	my $result = $data;

	if(ref $result eq 'HASH'){
		$result = {};
		while(my($key,$value) = each(%$data)){
			$result->{$key} = step3($value);
		}
	} elsif(ref $result eq 'ARRAY'){
		$result = [shuffle(@$result)];
	}

	return $result;
}

# Webscale storage
sub store_in_mongo {
	my $data = shift;
	system("echo \"$data\" > /dev/null");
}

################
# Main program #
################

# Fetches data from a backend repository and adapts it to our database.
# End result should be a structure with ordered values for arrays. Keys of the hashes must have 
# been renamed to kitten-themed words.
# Store in mongo for webscale performance.
store_in_mongo step3 step2 step1 generate;

print "'Tis done\n";
