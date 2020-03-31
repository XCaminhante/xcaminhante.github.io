#!/usr/local/bin/perl -lw

sub prt {
    print "mvfindpkgs.pl: ", @_, "          (\$0=$0)";
}

$w = $ARGV[0] || do{$tmp= `vgetconfig UserInterface DefaultWorkParent`;chop $tmp; $tmp . "/" . $ENV{USER}};
$w =~ m{/$} or $w .= "/";

prt "work dir: $w                         ";

# depth-first traversal of arg dir,
# stopping as soon as a vesta working dir (rather than regular dir) is found
sub process_dir {
    my $dir = shift;

    my @dirs = `ls -p $dir/|grep /\$`;

    #prt scalar @dirs, " dirs in $dir";
    
    foreach (@dirs) {

	chomp;

	my $is_co        = 0;
	my $is_scribble  = 0;
	my $is_plain_dir = 0;


	chomp (my $canonical_dir   = `csh -fc 'cd $dir$_;pwd'`);
	chomp (my $w_snapshots_dir = `vattrib -g session-dir $canonical_dir`);
	chomp (my $w_snapshots_ver = `vattrib -g session-ver-arc $canonical_dir`);
	chomp (my $next_ver_num    = `vattrib -g new-version $canonical_dir`);

	if ($w_snapshots_dir eq "") {
	    $is_plain_dir = 1;
	    process_dir ("$dir$_");
	} elsif ($next_ver_num eq "") {
	    $is_scribble = 1;
	} else {
	    $is_co = 1;
	}

	$is_co       and prt "checkout: $dir$_            ($w_snapshots_dir/$w_snapshots_ver)";
	$is_scribble and prt "scribble: $dir$_            ($w_snapshots_dir/$w_snapshots_ver)";
		
    }
}

process_dir($w);

