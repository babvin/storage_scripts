#setup public key between xtremIO and script host. refer -->>http://vstrong.info/2015/04/30/how-to-configure-emc-xtremio-user-with-public-key-authentication/
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
my $datestring = sprintf("%4d_%02d_%02d_%02d",($year + 1900),($mon+1),$mday,$hour);
$user = 'monitor-ro';
$priv_key = '/home/monitor-ro/.ssh/id_rsa';
$pub_key = '/home/monitor-ro/.ssh/id_rsa.pub';
my $xtrem = '10.0.28.17';	
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-clusters-info`;
@clus=split ('\n',$cc);
shift @clus;
foreach $line(@clus[0]){
@clusinfo = split (' ',$line);
#print $line;
$ser = $clusinfo[15];
$ver = $clusinfo[14];
}
#print $ver;
undef @clus, @clusinfo;
print "<table border='1' align=center width=1000>";
print "<tr><td colspan=14 align='center' bgcolor='#01DFD7'><h2>Health & Capacity Report of xtremIO - $ser - $ver - $datestring EST hours</h2></td></tr>"; 
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-clusters`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=14><strong>Cluster Status</strong></td></tr><tr>";
	for ($i=0;$i<14;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<14;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		if (grep {$_ eq "active"} @clusinfo and grep {$_ eq "connected"} @clusinfo){
		print "<td bgcolor='green'>$clusinfo[$i]</td>";
		}
		else {
			print "<td bgcolor='orange'>$clusinfo[$i]</td>";
			$red=1;
		}
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;


$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-clusters-performance`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=9><strong>Cluster Performance</strong></td></tr><tr>";
	for ($i=0;$i<9;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<9;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		print "<td>$clusinfo[$i]</td>";
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-targets-performance`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=9><strong>Targets Performance</strong></td></tr><tr>";
	for ($i=0;$i<9;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<9;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		print "<td>$clusinfo[$i]</td>";
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-storage-controllers`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=15><strong>Controllers Status</strong></td></tr><tr>";
	for ($i=0;$i<15;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<15;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		if (grep {$_ eq "healthy"} @clusinfo and grep {$_ eq "connected"} @clusinfo and grep {$_ eq "enabled"} @clusinfo){
		print "<td bgcolor='green'>$clusinfo[$i]</td>";
		}
		else {
			print "<td bgcolor='orange'>$clusinfo[$i]</td>";
			$red=1;
		}
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-storage-controllers-infiniband-ports`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=12><strong>Infiniband Ports Status</strong></td></tr><tr>";
	for ($i=0;$i<12;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<12;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		if (grep {$_ eq "up"} @clusinfo ){
		print "<td bgcolor='green'>$clusinfo[$i]</td>";
		}
		else {
			print "<td bgcolor='orange'>$clusinfo[$i]</td>";
			$red=1;
		}
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-daes-controllers`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=12><strong>DAE Controllers Status</strong></td></tr><tr>";
	for ($i=0;$i<12;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<12;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		if (grep {$_ eq "healthy"} @clusinfo and grep {$_ eq "enabled"} @clusinfo){
		print "<td bgcolor='green'>$clusinfo[$i]</td>";
		}
		else {
			print "<td bgcolor='orange'>$clusinfo[$i]</td>";
			$red=1;
		}
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-daes`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=12><strong>DAE  Status</strong></td></tr><tr>";
	for ($i=0;$i<12;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<12;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		if (grep {$_ eq "healthy"} @clusinfo ){
		print "<td bgcolor='green'>$clusinfo[$i]</td>";
		}
		else {
			print "<td bgcolor='orange'>$clusinfo[$i]</td>";
			$red=1;
		}
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-daes-psus`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=13><strong>DAE PSUS Status</strong></td></tr><tr>";
	for ($i=0;$i<13;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<13;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		if (grep {$_ eq "healthy"} @clusinfo ){
		print "<td bgcolor='green'>$clusinfo[$i]</td>";
		}
		else {
			print "<td bgcolor='orange'>$clusinfo[$i]</td>";
			$red=1;
		}
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-ssds`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=9><strong>SSD Drives Status</strong></td></tr><tr>";
	for ($i=0;$i<9;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<9;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		if (grep {$_ eq "healthy"} @clusinfo ){
		print "<td bgcolor='green'>$clusinfo[$i]</td>";
		}
		else {
			print "<td bgcolor='orange'>$clusinfo[$i]</td>";
			$red=1;
		}
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-initiator-groups`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=4><strong>Initiator Group Status</strong></td></tr><tr>";
	for ($i=0;$i<4;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<4;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		print "<td>$clusinfo[$i]</td>";
	}
	print "</tr>";
}
undef @clus, @clushead, @clusinfo;
$cc = `sshpass  ssh monitor-ro\@10.0.28.17 show-volumes`;
#print $cc;
@clus=split ('\n',$cc);
foreach $line(@clus[0]){
@clushead = split (' ',$line);
	print "<tr><td bgcolor='#BFBCBC' colspan=19><strong>Volumes Status</strong></td></tr><tr>";
	for ($i=0;$i<18;$i++){
		$clushead[$i] =~s/\R//g;
		print "<th>$clushead[$i]</th>";
	}
	print "</tr>";
}
shift @clus;
foreach $line(@clus){
@clusinfo = split (' ',$line);
print "<tr>";
	for ($i=0;$i<18;$i++){
		chomp ($clusinfo[$i]);
		$clusinfo[$i] =~s/\R//g;
		print "<td>$clusinfo[$i]</td>";
	}
	print "</tr>";
}
print "</table></html>";
if ($red==1)
{
print "\n We've issues with xtrem IO array, please read the report carefully and take necessary actions immediately. \n";
}