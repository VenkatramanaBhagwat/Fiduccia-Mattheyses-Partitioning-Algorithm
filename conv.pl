#Perl script that translates these formats into the hMetis partitioner format.
#thi file is taken from "http://vlsicad.ucsd.edu/UCLAWeb/cheese/ispd98.html" and modified 

$file = $ARGV[0];
$op=$ARGV[1];
unless (open(INFILE, "$file")) {
    die("Can't open net file input file $file \n");
}
open my $fh, ">", "$op" or die "Cannot open output file";

#parsing netlist header
$line = <INFILE>;  # 0
$line = <INFILE>;  # nPins
$line = <INFILE>;  # nNets
chop($line);
@words = split(/[\t ]+/, $line);
$nNets = $words[0];
$line = <INFILE>;  # nNodes
chop($line);
@words = split(/[\t ]+/, $line);
$nNodes = $words[0];
$line = <INFILE>;  # padOffset
chop($line);
@words = split(/[\t ]+/, $line);
$padOffset = $words[0];
printf $fh "$nNets $nNodes ";



#parsing nets
while ($line = <INFILE>) {
    chop($line);
    @words = split(/[\tap ]+/, $line);
    if ($line =~ /s/) {
        print $fh "\n";
    }
    $num = $words[1];
    if ($line =~ /a/) {
        printf $fh "a"."%d ", $num;
    } else {
        printf $fh "p"."%d ", $num+$padOffset;
    }
}
printf $fh "\n";
close(INFILE);
close($fh)


